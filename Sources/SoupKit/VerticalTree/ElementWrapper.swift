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
    
    public init(_ element: Element, indexPath: IndexPath, parent: ElementWrapper? = nil) {
        self.element = element
        self.indexPath = indexPath
        self.nodeTitle = ElementWrapper.nodetitleSetter(element)
        self.nodeDescription = ElementWrapper.nodeDescriptionSetter(element)
        self.parent = parent
    }
    
    public convenience init(document: Document) {
        self.init(document, indexPath: [0])
        cachedRoot = self
        wrapChildren(recursive: true)
    }
    
    public class var nodetitleSetter: (Element) -> String {
        return { e in
            let id = e.id()
            let ownText = e.ownText()
            var title = "<\(e.tagName())>"
            if !id.isEmpty {
                title += " #\(id)"
            }
            if !ownText.isEmpty {
                title += "\"\(ownText)\""
            }
            return title
        }
    }
    
    public class var nodeDescriptionSetter: (Element) -> String? {
        return { e in
            guard let attr = e.attributes?.clone() else { return nil }
            try? attr.remove(key: "id")
            let attrList = attr.asList()
            guard !attrList.isEmpty else {
                return nil
            }
            return attrList
                .map({"‣ " + $0.toString()})
                .joined(separator: "\n")
        }
    }
    
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


