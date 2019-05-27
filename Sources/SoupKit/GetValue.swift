//
//  GetValue.swift
//  SoupKit
//
//  Created by Courtland Bueno on 4/18/19.
//

import Foundation

public enum GetValue {
    case text
    case ownText
    case attribute(key: String)
    case absUrl(key: String)

    public var attribute: String? {
        get {
            guard case let .attribute(value) = self else { return nil }
            return value
        }
        set {
            guard case .attribute = self, let newValue = newValue else { return }
            self = .attribute(key: newValue)
        }
    }

    public var absUrl: String? {
        get {
            guard case let .absUrl(value) = self else { return nil }
            return value
        }
        set {
            guard case .absUrl = self, let newValue = newValue else { return }
            self = .absUrl(key: newValue)
        }
    }
}

extension GetValue: Equatable { }

extension GetValue: Codable {
    enum CodingKeys: String, CodingKey {
        case text
        case ownText
        case attribute
        case absUrl
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let firstKey = container.allKeys.first!
        switch firstKey {
        case .text:
            self = .text
        case .ownText:
            self = .ownText
        case .attribute:
            self = .attribute(key: try container.decode(String.self, forKey: firstKey))
        case .absUrl:
            self = .absUrl(key: try container.decode(String.self, forKey: firstKey))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .text:
            try container.encode(true, forKey: .text)
        case .ownText:
            try container.encode(true, forKey: .ownText)
        case .attribute(key: let key):
            try container.encode(key, forKey: .attribute)
        case .absUrl(key: let key):
            try container.encode(key, forKey: .absUrl)
        }
    }
}

extension GetValue: Hashable {
    
}
