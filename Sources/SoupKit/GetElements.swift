//
//  GetElements.swift
//  ImageDownloader
//
//  Created by Courtland Bueno on 4/18/19.
//  Copyright © 2019 Courtland Bueno. All rights reserved.
//

import Foundation

public enum GetElements {
    case all
    
    case byCSSSelector(query: String)
    case byTag(String)
    case byClass(String)
    
    case byAttribute(key: String, value: String)
    case byAttributeNot(key: String, value: String)
    case byAttributeWithKey(String)
    case byAttributeWithKeyPrefix(String)
    case byAttributeValuePrefix(key: String, valuePrefix: String)
    case byAttributeValueSuffix(key: String, valueSuffix: String)
    case byAttributeValueContaining(key: String, valueSubstring: String)
    case byAttributValueMatching(key: String, regex: String)
    
    case matchingText(regex: String)
    case matchingOwnText(regex: String)
    case containingText(searchText: String)
    case containingOwnText(searchText: String)
    
    case byIndex(siblingIndex: Int)
    case byIndexLessThan(siblingIndex: Int)
    case byIndexGreaterThan(siblingIndex: Int)

    public var byCSSSelector: String? {
        get {
            guard case let .byCSSSelector(value) = self else { return nil }
            return value
        }
        set {
            guard case .byCSSSelector = self, let newValue = newValue else { return }
            self = .byCSSSelector(query: newValue)
        }
    }

    public var byTag: String? {
        get {
            guard case let .byTag(value) = self else { return nil }
            return value
        }
        set {
            guard case .byTag = self, let newValue = newValue else { return }
            self = .byTag(newValue)
        }
    }

    public var byClass: String? {
        get {
            guard case let .byClass(value) = self else { return nil }
            return value
        }
        set {
            guard case .byClass = self, let newValue = newValue else { return }
            self = .byClass(newValue)
        }
    }

    public var byAttribute: (key: String, value: String)? {
        get {
            guard case let .byAttribute(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttribute = self, let newValue = newValue else { return }
            self = .byAttribute(key: newValue.0, value: newValue.1)
        }
    }

    public var byAttributeNot: (key: String, value: String)? {
        get {
            guard case let .byAttributeNot(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeNot = self, let newValue = newValue else { return }
            self = .byAttributeNot(key: newValue.0, value: newValue.1)
        }
    }

    public var byAttributeWithKey: String? {
        get {
            guard case let .byAttributeWithKey(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeWithKey = self, let newValue = newValue else { return }
            self = .byAttributeWithKey(newValue)
        }
    }

    public var byAttributeWithKeyPrefix: String? {
        get {
            guard case let .byAttributeWithKeyPrefix(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeWithKeyPrefix = self, let newValue = newValue else { return }
            self = .byAttributeWithKeyPrefix(newValue)
        }
    }

    public var byAttributeValuePrefix: (key: String, valuePrefix: String)? {
        get {
            guard case let .byAttributeValuePrefix(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeValuePrefix = self, let newValue = newValue else { return }
            self = .byAttributeValuePrefix(key: newValue.0, valuePrefix: newValue.1)
        }
    }

    public var byAttributeValueSuffix: (key: String, valueSuffix: String)? {
        get {
            guard case let .byAttributeValueSuffix(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeValueSuffix = self, let newValue = newValue else { return }
            self = .byAttributeValueSuffix(key: newValue.0, valueSuffix: newValue.1)
        }
    }

    public var byAttributeValueContaining: (key: String, valueSubstring: String)? {
        get {
            guard case let .byAttributeValueContaining(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributeValueContaining = self, let newValue = newValue else { return }
            self = .byAttributeValueContaining(key: newValue.0, valueSubstring: newValue.1)
        }
    }

    public var byAttributValueMatching: (key: String, regex: String)? {
        get {
            guard case let .byAttributValueMatching(value) = self else { return nil }
            return value
        }
        set {
            guard case .byAttributValueMatching = self, let newValue = newValue else { return }
            self = .byAttributValueMatching(key: newValue.0, regex: newValue.1)
        }
    }

    public var matchingText: String? {
        get {
            guard case let .matchingText(value) = self else { return nil }
            return value
        }
        set {
            guard case .matchingText = self, let newValue = newValue else { return }
            self = .matchingText(regex: newValue)
        }
    }

    public var matchingOwnText: String? {
        get {
            guard case let .matchingOwnText(value) = self else { return nil }
            return value
        }
        set {
            guard case .matchingOwnText = self, let newValue = newValue else { return }
            self = .matchingOwnText(regex: newValue)
        }
    }

    public var containingText: String? {
        get {
            guard case let .containingText(value) = self else { return nil }
            return value
        }
        set {
            guard case .containingText = self, let newValue = newValue else { return }
            self = .containingText(searchText: newValue)
        }
    }

    public var containingOwnText: String? {
        get {
            guard case let .containingOwnText(value) = self else { return nil }
            return value
        }
        set {
            guard case .containingOwnText = self, let newValue = newValue else { return }
            self = .containingOwnText(searchText: newValue)
        }
    }

    public var byIndex: Int? {
        get {
            guard case let .byIndex(value) = self else { return nil }
            return value
        }
        set {
            guard case .byIndex = self, let newValue = newValue else { return }
            self = .byIndex(siblingIndex: newValue)
        }
    }

    public var byIndexLessThan: Int? {
        get {
            guard case let .byIndexLessThan(value) = self else { return nil }
            return value
        }
        set {
            guard case .byIndexLessThan = self, let newValue = newValue else { return }
            self = .byIndexLessThan(siblingIndex: newValue)
        }
    }

    public var byIndexGreaterThan: Int? {
        get {
            guard case let .byIndexGreaterThan(value) = self else { return nil }
            return value
        }
        set {
            guard case .byIndexGreaterThan = self, let newValue = newValue else { return }
            self = .byIndexGreaterThan(siblingIndex: newValue)
        }
    }
    
}

extension GetElements: Equatable { }

extension GetElements: Codable {
    enum CodingKeys: String, CodingKey {
        case all
        case byCSSSelector
        case byTag
        case byClass
        
        case byAttribute
        case byAttributeNot
        case byAttributeWithKey
        case byAttributeWithKeyPrefix
        case byAttributeValuePrefix
        case byAttributeValueSuffix
        case byAttributeValueContaining
        case byAttributValueMatching
        
        case matchingText
        case matchingOwnText
        case containingText
        case containingOwnText
        
        case byIndex
        case byIndexLessThan
        case byIndexGreaterThan
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let firstKey = container.allKeys.first!
        switch firstKey {
        case .all:
            self = .all
        case .byCSSSelector:
            self = .byCSSSelector(query: try container.decode(String.self, forKey: firstKey))
        case .byTag:
            self = .byTag(try container.decode(String.self, forKey: firstKey))
        case .byClass:
            self = .byClass(try container.decode(String.self, forKey: firstKey))
        case .byAttribute:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttribute(key: stringArray[0], value: stringArray[1])
        case .byAttributeNot:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttributeNot(key: stringArray[0], value: stringArray[1])
        case .byAttributeWithKey:
            self = .byAttributeWithKey(try container.decode(String.self, forKey: firstKey))
        case .byAttributeWithKeyPrefix:
            self = .byAttributeWithKeyPrefix(try container.decode(String.self, forKey: firstKey))
        case .byAttributeValuePrefix:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttributeValuePrefix(key: stringArray[0], valuePrefix: stringArray[1])
        case .byAttributeValueSuffix:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttributeValueSuffix(key: stringArray[0], valueSuffix: stringArray[1])
        case .byAttributeValueContaining:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttributeValueContaining(key: stringArray[0], valueSubstring: stringArray[1])
        case .byAttributValueMatching:
            let stringArray = try container.decode([String].self, forKey: firstKey)
            self = .byAttributValueMatching(key: stringArray[0], regex: stringArray[1])
        case .matchingText:
            self = .matchingText(regex: try container.decode(String.self, forKey: firstKey))
        case .matchingOwnText:
            self = .matchingOwnText(regex: try container.decode(String.self, forKey: firstKey))
        case .containingText:
            self = .containingText(searchText: try container.decode(String.self, forKey: firstKey))
        case .containingOwnText:
            self = .containingOwnText(searchText: try container.decode(String.self, forKey: firstKey))
        case .byIndex:
            self = .byIndex(siblingIndex: try container.decode(Int.self, forKey: firstKey))
        case .byIndexLessThan:
            self = .byIndexLessThan(siblingIndex: try container.decode(Int.self, forKey: firstKey))
        case .byIndexGreaterThan:
            self = .byIndexGreaterThan(siblingIndex: try container.decode(Int.self, forKey: firstKey))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .all:
            try container.encode(true, forKey: .all)
        case .byCSSSelector(let query):
            try container.encode(query, forKey: .byCSSSelector)
        case .byTag(let tag):
            try container.encode(tag, forKey: .byTag)
        case .byClass(let className):
            try container.encode(className, forKey: .byClass)
        case .byAttribute(let key, let value):
            try container.encode([key,value], forKey: .byAttribute)
        case .byAttributeNot(let key, let value):
            try container.encode([key,value], forKey: .byAttributeNot)
        case .byAttributeWithKey(let key):
            try container.encode(key, forKey: .byAttributeWithKey)
        case .byAttributeWithKeyPrefix(let keyPrefix):
            try container.encode(keyPrefix, forKey: .byAttributeWithKeyPrefix)
        case .byAttributeValuePrefix(let key, let valuePrefix):
            try container.encode([key,valuePrefix], forKey: .byAttributeValuePrefix)
        case .byAttributeValueSuffix(let key, let valueSuffix):
            try container.encode([key,valueSuffix], forKey: .byAttributeValueSuffix)
        case .byAttributeValueContaining(let key, let valueSubstring):
            try container.encode([key, valueSubstring], forKey: .byAttributeValueContaining)
        case .byAttributValueMatching(let key, let regex):
            try container.encode([key,regex], forKey: .byAttributValueMatching)
        case .matchingText(let regex):
            try container.encode(regex, forKey: .matchingText)
        case .matchingOwnText(let regex):
            try container.encode(regex, forKey: .matchingOwnText)
        case .containingText(let searchText):
            try container.encode(searchText, forKey: .containingText)
        case .containingOwnText(let searchText):
            try container.encode(searchText, forKey: .containingOwnText)
        case .byIndex(let siblingIndex):
            try container.encode(siblingIndex, forKey: .byIndex)
        case .byIndexLessThan(let siblingIndex):
            try container.encode(siblingIndex, forKey: .byIndexLessThan)
        case .byIndexGreaterThan(let siblingIndex):
            try container.encode(siblingIndex, forKey: .byIndexGreaterThan)
        }
    }
    
    
}

extension GetElements: Hashable {
    
}

