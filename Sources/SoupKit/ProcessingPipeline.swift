//
//  ProcessingPipeline.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/11/19.
//

import Foundation

public struct ProcessingPipeline: Equatable, Hashable, Codable {
    public let name: String
    
    fileprivate(set) public var keyedProcessors: [String : ProcessingChain]
    
    fileprivate static let idPrefix = "com.courtlandbueno.SoupKit.ProcessingPipeline."
    
    public let identifier: String
    
    public init(name: String, keyedProcessors: [String : ProcessingChain] = [:]) {
        self.name = name
        self.keyedProcessors = keyedProcessors
        var idSuffix = name
        var splits = name.split(separator: " ").map({ $0.lowercased() })
        if splits.count > 1 {
            idSuffix = splits.dropFirst().reduce(splits.removeFirst(), { $0 + $1.uppercased() })
        }
        self.identifier = ProcessingPipeline.idPrefix + idSuffix
    }
    
    public static func ==(lhs: ProcessingPipeline, rhs: ProcessingPipeline) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

public extension ProcessingPipeline {
    
    subscript(key: String) -> ProcessingChain? {
        get { return keyedProcessors[key] }
        set { keyedProcessors[key] = newValue }
    }
    
    mutating func reset() {
        keyedProcessors.removeAll()
    }
}


public extension ProcessingPipeline {
    static let allImages = ProcessingPipeline(name: "All Images",
                                              keyedProcessors: [
                                                "image" : ProcessingChain(selector: "img", attributeKey: "src", isAbsolute: true)
                                                , "title" : ProcessingChain(selector: "img", attributeKey: "alt")
        ])
    
    static let allLinks = ProcessingPipeline(name: "All Links",
                                             keyedProcessors: [
                                                "selection" : ProcessingChain(selector: "a", attributeKey: "href", isAbsolute: true)
                                                , "title" : ProcessingChain(selector: "a", attributeKey: "alt")
        ])
    
    static let empty = ProcessingPipeline(name: "")
    
    var isEmpty: Bool {
        return self == .empty
    }
}


