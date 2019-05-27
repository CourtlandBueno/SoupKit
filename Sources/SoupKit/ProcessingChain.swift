//
//  ProcessingChain.swift
//  SoupKit
//
//  Created by Courtland Bueno on 4/18/19.
//


import Foundation

public struct ProcessingChain: Equatable, Hashable, Codable {
    public var getters: [GetElements]
    public var extractor: GetValue
    
    public init(getters: [GetElements], extractor: GetValue) {
        self.getters = getters
        self.extractor = extractor
    }
}

extension ProcessingChain {
    public init(selectors: [String], attributeKey: String, isAbsolute: Bool = false) {
        self = .init(getters: selectors.map({GetElements.byCSSSelector(query: $0)}),
                     extractor: isAbsolute ? .absUrl(key: attributeKey) : .attribute(key: attributeKey))
    }
    
    public init(selector: String, attributeKey: String, isAbsolute: Bool = false) {
        self = .init(selectors: [selector], attributeKey: attributeKey, isAbsolute: isAbsolute)
    }
}

extension ProcessingChain {
    public mutating func appendGetter(_ getter: GetElements) {
        getters.append(getter)
    }
    
    public mutating func appendSelector(query: String) {
        appendGetter(.byCSSSelector(query: query))
    }
}
