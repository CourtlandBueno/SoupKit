//
//  SwiftSoupExt.swift
//  FisherKitExample-MacOS
//
//  Created by Courtland Bueno on 3/17/19.
//

import Foundation
import SwiftSoup

extension Array where Element == SwiftSoup.Element {
    public subscript(path: IndexPath) -> Element? {
        var mutablePath = path
        guard !path.isEmpty else { return nil }
        let firstIndex = mutablePath.removeFirst()
        guard indices.contains(firstIndex) else { return nil }
        return self[firstIndex][mutablePath]
    }
}

extension Element {
    public subscript(path: IndexPath) -> Element? {
        var mutablePath = path
        
        var nextElement: Element? = self
        var nextElements: [Element] {
            return nextElement?.children().array() ?? []
        }
        
        while !mutablePath.isEmpty {
            let nextIndex = mutablePath.removeFirst()
            guard nextElements.indices.contains(nextIndex) else {
                return nil
            }
            
            nextElement = self.children().array()[nextIndex]
        }
        
        return nextElement
    }
}

extension KnownElements {
    public var tag: Tag {
        return Tag(rawValue)
    }
    
    public func new(baseUri: String = "") -> Element {
        return Element(tag, baseUri)
    }
    
    public init?(tag: Tag) {
        guard let value = KnownElements(rawValue: tag.toString()) else {
            return nil
        }
        self = value
    }
}

extension Element {
    public convenience init(_ known: KnownElements, baseUri: String = "") {
        self.init(known.tag, baseUri)
    }
}

public func parse(payload: DocumentParsingPayload) throws -> Document {
    return try SwiftSoup.parse(payload.html, payload.url.absoluteString)
}
