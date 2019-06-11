//
//  Models+CustomStringConvertible.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/11/19.
//

import Foundation

extension GetElements: CustomStringConvertible {
    public var description: String {
        switch self {
        case .all:
            return "*"
        case .byCSSSelector(let query):
            return "CSS Selector('\(query)')"
        case .byTag(let value):
            return value
        case .byClass(let value):
            return "." + value
        case .byAttribute(let key, let value):
            return "[\(key)=\(value)]"
        case .byAttributeNot(let key, let value):
            return "[\(key)!=\(value)]"
        case .byAttributeWithKey(let key):
            return "[\(key)]"
        case .byAttributeWithKeyPrefix(let key):
            return "[^\(key)]"
        case .byAttributeValuePrefix(let key, let valuePrefix):
            return "[\(key)^=\(valuePrefix)]"
        case .byAttributeValueSuffix(let key, let valueSuffix):
            return "[\(key)&=\(valueSuffix)]"
        case .byAttributeValueContaining(let key, let valueSubstring):
            return "[\(key)*=\(valueSubstring)]"
        case .byAttributValueMatching(let key, let regex):
            return "[\(key)~=\(regex)]"
        case .matchingText(let regex):
            return ":matches(\(regex))"
        case .matchingOwnText(let regex):
            return ":matchesOwn(\(regex))"
        case .containingText(let searchText):
            return ":contains(\(searchText))"
        case .containingOwnText(let searchText):
            return ":containsOwn(\(searchText))"
        case .byIndex(let siblingIndex):
            return ":eq(\(siblingIndex))"
        case .byIndexLessThan(let siblingIndex):
            return ":lt(\(siblingIndex))"
        case .byIndexGreaterThan(let siblingIndex):
            return ":gt(\(siblingIndex))"
        }
    }
    
    
}


extension GetValue: CustomStringConvertible {
    public var description: String {
        let value: String
        switch self {
        case .text:
            value = "text"
        case .ownText:
            value = "own-text"
        case .attribute(let key):
            value = "[\(key)]"
        case .absUrl(let key):
            value = "||\(key)||"
        }
        
        return value
    }
}

extension ProcessingChain: CustomStringConvertible {
    public var description: String {
        var output = ""
        print(getters.map({$0.description}).joined(separator: " && "), " ==> ", extractor.description, to: &output)
        return output
    }
}

extension ProcessingPipeline: CustomStringConvertible {
    public var description: String {
        var output = ""
        print(name, terminator: "   ", to: &output)
        let padding = String(repeating: " ", count: name.count + 2)
        let sortedProcessors = keyedProcessors.sorted(by: {$0.key < $1.key})
        if let firstKeyedProcessor = sortedProcessors.first {
            let key = firstKeyedProcessor.key
            let chain = firstKeyedProcessor.value
            print("🔑:", key, "⛓:", chain, to: &output)
        }
        for (key, chain) in sortedProcessors.dropFirst() {
            print(padding, "🔑:", key, "⛓:", chain, to: &output)
        }
        return output
    }
}
