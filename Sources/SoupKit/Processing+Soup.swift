//
//  Processing+Soup.swift
//  SoupKit
//
//  Created by Courtland Bueno on 4/18/19.
//

import Foundation
import SwiftSoup

//MARK: - GetElements
public extension GetElements {
    func apply(to target: Element) throws -> Elements {
        switch self {
        case .all:
            return try target.getAllElements()
        case .byCSSSelector(query: let query):
            return try target.select(query)
        case .byTag(let tag):
            return try target.getElementsByTag(tag)
        case .byClass(let className):
            return try target.getElementsByClass(className)
        case .byAttribute(let key, let value):
            return try target.getElementsByAttributeValue(key, value)
        case .byAttributeWithKey(let key):
            return try target.getElementsByAttribute(key)
        case .byAttributeWithKeyPrefix(let keyPrefix):
            return try target.getElementsByAttributeStarting(keyPrefix)
        case .byAttributeNot(let key, let value):
            return try target.getElementsByAttributeValueNot(key,value)
        case .byAttributeValuePrefix(let key, let valuePrefix):
            return try target.getElementsByAttributeValueStarting(key, valuePrefix)
        case .byAttributeValueContaining(let key, let valueSubstring):
            return try target.getElementsByAttributeValueContaining(key, valueSubstring)
        case .byAttributeValueSuffix(let key, let valueSuffix):
            return try target.getElementsByAttributeValueEnding(key, valueSuffix)
        case .byAttributValueMatching(let key, let regex):
            return try target.getElementsByAttributeValueMatching(key, regex)
        case .matchingText(let regex):
            return try target.getElementsMatchingText(regex)
        case .matchingOwnText(let regex):
            return try target.getElementsMatchingOwnText(regex)
        case .containingText(let searchText):
            return try target.getElementsContainingText(searchText)
        case .containingOwnText(let searchText):
            return try target.getElementsContainingOwnText(searchText)
        case .byIndex(let siblingIndex):
            return try target.getElementsByIndexEquals(siblingIndex)
        case .byIndexLessThan(let siblingIndex):
            return try target.getElementsByIndexLessThan(siblingIndex)
        case .byIndexGreaterThan(let siblingIndex):
            return try target.getElementsByIndexGreaterThan(siblingIndex)
        }
    }
    
    func apply(to targets: Elements) throws -> Elements {
        switch self {
        case .byCSSSelector(query: let query):
            return try targets.select(query)
        default:
            return Elements(Array(try targets.map({ try apply(to: $0) }).joined()))
        }
        
    }
    
    func applySafely(to target: Element) -> Elements {
        return (try? apply(to: target)) ?? Elements()
    }
}

//MARK: - GetValue
extension GetValue {
    public func apply(to target: Element) throws -> String {
        switch self {
        case .text:
            return try target.text()
        case .ownText:
            return target.ownText()
        case .attribute(let key):
            return try target.attr(key)
        case .absUrl(let key):
            return try target.absUrl(key)
        }
    }
    
    public func apply(to targets: Elements) throws -> [String] {
        return try targets.map({ try apply(to: $0) })
    }
}

//MARK: - ProcessingChain
extension ProcessingChain {
    public func process(_ element: Element) throws -> [String] {
        var mutableElement: Element? = element
        var elements = Elements([])
        
        for getter in getters {
            if let el = mutableElement {
                defer { mutableElement = nil }
                elements = try getter.apply(to: el)
            } else {
                elements = try getter.apply(to: elements)
            }
        }
        if let el = mutableElement {
            return [try extractor.apply(to: el)]
        } else {
            return try extractor.apply(to: elements)
        }
    }
}

//MARK: - ProcessingPipeline
extension ProcessingPipeline {
    public func execute(_ element: Element) throws -> ProcessedValues {
        return ProcessedValues(values: try keyedProcessors
            .mapValues({ chain in
                try chain.process(element)
            }))
        
    }
}
