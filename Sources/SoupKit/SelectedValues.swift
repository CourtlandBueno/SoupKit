//
//  File.swift
//  
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation

public struct SelectedValues: Equatable, Hashable, Codable {
    public var singles: [String : String]
    public var groups: [String: [String]]
    
    public init(singles: [String : String], groups: [String : [String]]) {
        self.singles = singles
        self.groups = groups
    }
}

public extension SelectedValues {
    static let empty = SelectedValues(singles: [:], groups: [:])
    
    var isEmpty: Bool {
        return self == .empty
    }
}
