//
//  ProcessedValues.swift
//  SoupKit
//
//  Created by Courtland Bueno on 4/18/19.
//

import Foundation

@dynamicMemberLookup
public struct ProcessedValues: Equatable, Hashable, Codable {
    fileprivate(set) public var values: [String : [String]]
    
    public subscript(dynamicMember member: String) -> [String] {
        get { return values[member] ?? [] }
        set { values[member] = newValue }
    }
    
    public init(values: [String : [String]]) {
        self.values = values
    }
}
