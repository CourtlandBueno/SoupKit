//
//  SelectorQuery.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/11/19.
//

import Foundation

enum Operator {
    enum Attr {
        enum Key: String, Equatable, Hashable, CaseIterable {
            case equalTo = ""
            case startsWith = "^"
        }
        enum Value: String, Equatable, Hashable, CaseIterable {
            case equalTo = "="
            case startsWith = "^="
            case endsWith = "$="
            case matches = "~="
            case contains = "*="
        }
    }
    enum SiblingIndex: String, Equatable, Hashable, CaseIterable {
        case equalTo = "eq"
        case lessThan = "lt"
        case greaterThan = "gt"
    }
    
    enum Selector: String, Equatable, Hashable, CaseIterable {
        case has
        case not
    }
    
    enum Text: Equatable, Hashable, RawRepresentable, CaseIterable {
        case contains(own: Bool)
        case matches(own: Bool)
        
        var rawValue: String {
            switch self {
            case .contains(let own):
                return "contains" + (own ? "Own" : "")
            case .matches(let own):
                return "matches" + (own ? "Own" : "")
            }
        }
        
        init?(rawValue: String) {
            switch rawValue.trimmingCharacters(in: .whitespaces) {
            case "contains":
                self = .contains(own: false)
            case "matches":
                self = .matches(own: false)
            case "containsOwn":
                self = .contains(own: true)
            case "matchesOwn":
                self = .matches(own: true)
            default:
                return nil
            }
        }
        
        static var allCases: [Text] {
            return [.matches(own: true), .contains(own: true), .matches(own: false), .contains(own: false)]
        }
    }
}

enum SelectorQuery: Equatable, Hashable {
    case allElements
    case tag(String, namespace: String?)
    case id(String)
    case classname(String)
    
    case attr(Operator.Attr.Key, key: String)
    case attrKey(String, Operator.Attr.Value, value: String)
    
}


extension SelectorQuery: RawRepresentable {
    var rawValue: String {
        switch self {
        case .allElements:
            return "*"
        case .tag(let tagname, namespace: let namespace):
            guard let namespace = namespace else { return tagname }
            return namespace + "|" + tagname
        case .id(let id):
            return "#\(id)"
        case .classname(let name):
            return "." + name
        case .attr(let op, key: let key):
            return "[" + op.rawValue + key + "]"
        case .attrKey(let key, let op, value: let value):
            return "[" + key + op.rawValue + value + "]"
        }
    }
    
    init?(rawValue: String) {
        switch rawValue.trimmingCharacters(in: .whitespaces) {
        case "*":
            self = .allElements
        case let x where x.hasPrefix("#"):
            self = .id(String(x.dropFirst()))
        case let x where x.hasPrefix("."):
            self = .classname(String(x.dropFirst()))
        case var x:
            if let _ = x.range(of: #"^\[.*\]$"#, options: .regularExpression) {
                x = x.trimmingCharacters(in: .init(charactersIn: "[]"))
                if x.hasPrefix("^") {
                    x = x.trimmingCharacters(in: .init(charactersIn: "^"))
                    guard !x.isEmpty else { return nil }
                    self = .attr(.startsWith, key: x)
                } else {
                    let splitAtEqualSign = x.split(separator: .init("="))
                    switch splitAtEqualSign.count {
                    case 1:
                        self = .attr(.equalTo, key: x)
                    case 2:
                        let firstPart = splitAtEqualSign.first!
                        let lastPart = splitAtEqualSign.last!
                        switch firstPart {
                        case let x where x.hasSuffix("^"):
                            self = .attrKey(String(x.dropLast()), .startsWith, value: String(lastPart))
                        case let x where x.hasSuffix("$"):
                            self = .attrKey(String(x.dropLast()), .endsWith, value: String(lastPart))
                        case let x where x.hasSuffix("~"):
                            self = .attrKey(String(x.dropLast()), .matches, value: String(lastPart))
                        case let x where x.hasSuffix("*"):
                            self = .attrKey(String(x.dropLast()), .contains, value: String(lastPart))
                        default:
                            self = .attrKey(String(firstPart), .equalTo, value: String(lastPart))
                        }
                    default:
                        return nil
                    }
                }
            } else if let _ = x.range(of: #"^[a-zA-Z]*\|?[a-zA-Z]+\S*$"#, options: .regularExpression) {
                if x.contains("|") {
                    let splits = x.split(separator: "|")
                    guard splits.count == 2 else {
                        return nil
                    }
                    let ns = String(splits.first!)
                    let tagname = String(splits.last!)
                    
                    self = .tag(tagname, namespace: ns)
                } else {
                    self = .tag(x, namespace: nil)
                }
            } else {
                return nil
            }
        }
    }
}

enum PseudoSelector: Equatable, Hashable {
    case siblingIndex(Operator.SiblingIndex, Int)
    case selector(Operator.Selector, String)
    case text(Operator.Text, String)
}

extension PseudoSelector: RawRepresentable {
    var rawValue: String {
        
        let rawOp: String
        let value: String
        switch self {
        case .siblingIndex(let op, let idx):
            rawOp = op.rawValue
            value = idx.description
        case .selector(let op, let query):
            rawOp = op.rawValue
            value = query
        case .text(let op, let query):
            rawOp = op.rawValue
            value = query
        }
        return ":" + rawOp + "(\(value))"
    }
    
    init?(rawValue: String) {
        if let sibIndexRange = rawValue.range(of: #"^:(lt|gt|eq)\(\d+\)$"#, options: .regularExpression),
            let valRange = rawValue.range(of: #"\d+"#, options: .regularExpression),
            let sibIndex = Int(rawValue[valRange]) {
            
            switch rawValue[sibIndexRange].dropFirst() {
            case let x where x.hasPrefix("lt"):
                self = .siblingIndex(.lessThan, sibIndex)
            case let x where x.hasPrefix("gt"):
                self = .siblingIndex(.greaterThan, sibIndex)
            case let x where x.hasPrefix("eq"):
                self = .siblingIndex(.equalTo, sibIndex)
            default:
                return nil
            }
        } else if let selectorRange = rawValue.range(of: #"^:(has|not)\(.+\)$"#, options: .regularExpression),
            let valRange = rawValue.range(of: #"\(.+\)$"#, options: .regularExpression) {
            let query = rawValue[valRange].trimmingCharacters(in: .init(charactersIn: "()"))
            switch rawValue[selectorRange].dropFirst() {
            case let x where x.hasPrefix(Operator.Selector.has.rawValue):
                self = .selector(.has, query)
            case let x where x.hasPrefix(Operator.Selector.not.rawValue):
                self = .selector(.not, query)
            default:
                return nil
            }
        } else if let textRange = rawValue.range(of: #"^:(contains|matches)(Own)?\(.+\)$"#, options: .regularExpression),
            let valRange = rawValue.range(of: #"\(.+\)$"#, options: .regularExpression) {
            let query = rawValue[valRange].trimmingCharacters(in: .init(charactersIn: "()"))
            
            let ops = [
                Operator.Text.matches(own: true),
                Operator.Text.contains(own: true),
                Operator.Text.contains(own: false),
                Operator.Text.matches(own: false),
            ]
            guard let match = ops.first(where: { rawValue[textRange].dropFirst().hasPrefix($0.rawValue) }) else {
                return nil
            }
            self = .text(match, query)
        } else { return nil }
    }
}

struct SelectorComponents: Equatable, Hashable {
    
    struct TagComponent: Equatable, Hashable, RawRepresentable {
        var namespace: String?
        var tag: String
        
        var rawValue: String {
            if let namespace = namespace {
                return namespace + "|" + tag
            } else {
                return tag
            }
        }
        
        init?(rawValue: String) {
            let x = rawValue.trimmingCharacters(in: .whitespaces)
            
            guard let _ = x.range(of: #"^[a-zA-Z]*\|?[a-zA-Z]+\S*$"#, options: .regularExpression) else {
                return nil
            }
            guard x.contains("|") else {
                self.tag = x
                return
            }
            let splits = x.split(separator: "|")
            guard splits.count == 2 else {
                return nil
            }
            self.namespace = String(splits.first!)
            self.tag = String(splits.last!)
            
        }
    }
    
    
    
    enum TailComponent: Equatable, Hashable, RawRepresentable {
        
        enum AttrComponent: Equatable, Hashable, RawRepresentable {
            case key(Operator.Attr.Key, String)
            case value(String, Operator.Attr.Value, String)
            
            var rawValue: String {
                switch self {
                case .key(let op, let key):
                    return "[" + op.rawValue + key + "]"
                case .value(let key, let op, let value):
                    return "[" + key + op.rawValue + value + "]"
                }
            }
            
            init?(rawValue: String) {
                var x = rawValue.trimmingCharacters(in: .whitespaces)
                guard let _ = x.range(of: #"^\[.*\]$"#, options: .regularExpression) else {
                    return nil
                }
                
                if x.hasPrefix("^") {
                    x = x.trimmingCharacters(in: .init(charactersIn: "^"))
                    guard !x.isEmpty else { return nil }
                    self = .key(.startsWith, x)
                } else {
                    let splitAtEqualSign = x.split(separator: .init("="))
                    switch splitAtEqualSign.count {
                    case 1:
                        self = .key(.equalTo, x)
                    case 2:
                        let firstPart = splitAtEqualSign.first!
                        let lastPart = splitAtEqualSign.last!
                        switch firstPart {
                        case let x where x.hasSuffix("^"):
                            self = .value(String(x.dropLast()), .startsWith, String(lastPart))
                        case let x where x.hasSuffix("$"):
                            self = .value(String(x.dropLast()), .endsWith, String(lastPart))
                        case let x where x.hasSuffix("~"):
                            self = .value(String(x.dropLast()), .matches, String(lastPart))
                        case let x where x.hasSuffix("*"):
                            self = .value(String(x.dropLast()), .contains, String(lastPart))
                        default:
                            self = .value(String(firstPart), .equalTo, String(lastPart))
                        }
                    default:
                        return nil
                    }
                }
            }
        }
        
        case id(String)
        case attr(AttrComponent)
        case classname(String)
        case attrAndClass(AttrComponent, classname: String)
        
        var rawValue: String {
            switch self {
            case .id(let id):
                return "#" + id
            case .attr(let attrComp):
                return attrComp.rawValue
            case .classname(let classname):
                return "." + classname
            case .attrAndClass(let attrComp, let classname):
                return attrComp.rawValue + "." + classname
            }
        }
        
        init?(rawValue: String) {
            return nil
        }
    }
    
    
    var tag: TagComponent?
    var tail: TailComponent?
    var pseudos: [PseudoSelector]
    
    var rawValue: String {
        return (tag?.rawValue ?? "") + (tail?.rawValue ?? "") + pseudos.map({$0.rawValue}).joined()
    }
}

extension NSRange {
    var isFound: Bool {
        return location != NSNotFound && length > 0
    }
}
//
//extension SelectorComponents: RawRepresentable {
//    var rawValue: String {
//        return (head?.rawValue ?? "") + (tail?.rawValue ?? "") + (pseudo?.rawValue ?? "")
//    }
//
//
//    init?(rawValue: String) {
//        let trimmedValue = rawValue.trimmingCharacters(in: .whitespaces)
//
//        guard trimmedValue != "*" else {
//            self.head = .all
//            return
//        }
//        let pseudo = "pseudo"
//        let head = "head"
//        let tail = "tail"
//        let names = [head, tail, pseudo]
//
////        let pattern = #"^(?<\#(ns)>[a-zA-Z]*\|)?(?<\#(tag)>[a-zA-Z]+\S*)(?<\#(cls)>\.[a-zA-Z][^\[(:]*?)?(?<\#(attr)>\[[a-zA-Z0-9]+[^:]*\])?(?<\#(pseudo)>:.++)?\$"#
//        let pattern = #"^(?<\#(head)>([a-zA-Z]*\|)?([a-zA-Z]+\S*))?(?<\#(tail)>(\.[a-zA-Z][^\[(:]*?)?(\[[a-zA-Z0-9]+[^:]*\])?)?(?<\#(pseudo)>:.++)?\$"#
//        let regex = try! NSRegularExpression(pattern: pattern, options: [.anchorsMatchLines])
//        let fullRange = NSRange(trimmedValue.startIndex..<trimmedValue.endIndex, in: trimmedValue)
//
//        var _head: HeadComponent?
//        var _tail: TailComponent?
//        var _pseudo: PseudoSelector?
//
//        if let firstMatch = regex.firstMatch(in: trimmedValue, options: [], range: fullRange) {
//
//            if #available(OSX 10.13, *) {
//
//                names.map({ ($0, firstMatch.range(withName: $0)) })
//                    .filter({ _, range -> Bool in
//                        return range.isFound
//                    }).compactMap({ (name, range) -> (String, String)? in
//                        guard let r = Range(range, in: trimmedValue) else { return nil }
//                        let substring = trimmedValue[r]
//                        return (name, String(substring))
//                    })
//                    .forEach({ (name, substring) in
//                        switch name {
//                        case head:
//                            _head = HeadComponent(rawValue: substring)
//                        case tail:
//                            _tail = TailComponent(rawValue: substring)
//                        case pseudo:
//                            _pseudo = PseudoSelector(rawValue: substring)
//                        default: break
//                        }
//                })
//
//
//            } else {
//                // Fallback on earlier versions
//            }
//
//
//        }
//        guard _head != nil || _tail != nil || _pseudo != nil else {
//            return nil
//        }
//        self.head = _head
//        self.tail = _tail
//        self.pseudo = _pseudo
//    }
//}

enum SelectorCombo {
    case elementsWithID(tagname: String, id: String)
    case elementsWithClass(tagname: String, classname: String)
}

struct CSSSelector {
    var rawValue: String
    
    
}
//
//extension CSSSelector: RawRepresentable {
//
//}
//
//extension CSSSelector: LosslessStringConvertible {
//    var description: String {
//        return rawValue
//    }
//
//    init?(_ description: String) {
//        guard !description.isEmpty else {
//            return nil
//        }
//        self.rawValue = description
//    }
//}
//extension CSSSelector: ExpressibleByStringLiteral {
//    init(stringLiteral: String) {
//        self.rawValue = stringLiteral
//    }
//}
