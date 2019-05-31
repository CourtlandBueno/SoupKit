//
//  SwiftSoup+VerticalTree.swift
//  SoupKit iOS
//
//  Created by Courtland Bueno on 5/4/19.
//

import SwiftSoup
import Foundation
import VerticalTree

public final class ElementWrapper: VerticalTreeNode, Infomation {
    
    public let indexPath: IndexPath
    
    weak public var parent: ElementWrapper?
    
    public var children: [ElementWrapper] = []
    
    public var childs: [ElementWrapper] {
        return children
    }
    
    public var length: TreeNodeLength = .indexLength(80)
    
    public var nodeTitle: String = ""
    
    public var nodeDescription: String? = nil
    
    public var info: Infomation { return self }
    
    public static var initialIsFold: Bool {
        return false
    }

    public var isFold: Bool = ElementWrapper.initialIsFold
    
    public let element: Element
    
    public init(_ element: Element,
                indexPath: IndexPath,
                parent: ElementWrapper? = nil,
                children: [ElementWrapper] = [],
                titleSetter: @escaping (Element) -> String = ElementWrapper.nodetitleSetter,
                descriptionSetter: @escaping (Element) -> String? = ElementWrapper.nodeDescriptionSetter,
                length: TreeNodeLength = .indexLength(80)) {
        self.element = element
        self.indexPath = indexPath
        self.nodeTitle = titleSetter(element)
        self.nodeDescription = descriptionSetter(element)
        self.parent = parent
        self.children = children
        self.length = length
    }
    
    public convenience init(document: Document) {
        self.init(root: document)
    }
    
    public convenience init(root: Element) {
        self.init(root, indexPath: [0])
        cachedRoot = self
        wrapChildren(recursive: true)
    }
    
    public convenience init(elements: Elements, baseUri: String, queries: [String] = []) {
        guard elements.count > 1 else {
            self.init(root: elements.first!)
            return
        }
        let base = Element(.ol, baseUri: baseUri)
        self.init(base, indexPath: [0], titleSetter: { _ in queries.joined(separator: ", ")})
        cachedRoot = self
        self.children = elements.enumerated().map({ElementWrapper($0.element, indexPath: [0,$0.offset], parent: self)})
        children.forEach({ $0.wrapChildren(recursive: true) })
    }
    
    public static var nodetitleSetter: (Element) -> String = {
        return { e in
            let ownText = e.ownText()
            return "<" + e.tagName() + "> " + (ownText.isEmpty ? "" : "\"\(ownText)\"")
        }
    }()
    
    public static var nodeDescriptionSetter: (Element) -> String? = {
        return { e in
            var descriptionElements: [String] = []
            if let cssSelector = try? e.cssSelector() {
                descriptionElements.append(" ⌗ " + cssSelector)
            }
            if let attrList = e.attributes?.asList() {
                for attr in attrList {
                    let key = attr.getKey()
                    var de: String = "[\(key)] "
                    switch key {
                    case "href", "src":
                        if let absValue = try? e.absUrl(key) {
                            de += absValue
                        } else { fallthrough }
                    default:
                        de += attr.getValue()
                    }
                    descriptionElements.append(" ‣ " + de)
                }
            }
            guard !descriptionElements.isEmpty else { return nil }
            return descriptionElements.joined(separator: "\n")
        }
    }()
    
    public func wrapChildren(recursive: Bool) {
        for (offset,child) in element.children.enumerated() {
            let wrappedChild = ElementWrapper(child, indexPath: indexPath.appending(offset), parent: self)
            children.append(wrappedChild)
            if recursive {
                wrappedChild.wrapChildren(recursive: recursive)
            }
        }
    }
    
    lazy var cachedRoot: ElementWrapper = self.getRootNodeDefault()
    lazy var cachedSubnodes: [ElementWrapper] = self.allSubnodesDefault(false)
    
    func getRootNodeDefault() -> ElementWrapper {
        let seq = sequence(first: self) { $0.parent }
        return seq.first(where: { $0.parent == nil })!
    }
    
    public func getRootNode() -> ElementWrapper {
        return cachedRoot //?? getRootNodeDefault()
    }
    
    func allSubnodesDefault(_ includeSelf: Bool = true) -> [ElementWrapper] {
        var arr = self.childs.reduce([T]()) { $0 + [$1] + $1.allSubnodes(false) }
        if includeSelf { arr.insert(self, at: 0) }
        return arr
    }
    
    public func allSubnodes(_ includeSelf: Bool = true) -> [T] {
        return includeSelf ? [self] + cachedSubnodes : cachedSubnodes
    }

    var treeDeepDefault: Int {
        return getRootNode().allSubnodes().max { $0.currentDeep < $1.currentDeep }?.currentDeep ?? 1
    }
    
    lazy var cachedDepth: Int = self.treeDeepDefault
    
    public var treeDeep: Int {
        return cachedDepth
    }
    
}


