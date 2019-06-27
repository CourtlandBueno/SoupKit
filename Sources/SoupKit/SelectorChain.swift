//
//  File.swift
//  
//
//  Created by Courtland Bueno on 6/25/19.
//

import Foundation

public struct SelectorChain: Equatable, Hashable, Codable {
    public var selectors: [String]
    public var keyedExtractors: [String : GetValue]
}

public extension SelectorChain {
    static let empty = SelectorChain(selectors: [], keyedExtractors: [:])
    
    init(processingChain: ProcessingChain, extractorKey: String) {
        self.selectors = processingChain.getters.map({$0.description})
        self.keyedExtractors = [extractorKey : processingChain.extractor]
    }
    
    func hasEquivalentSelectors(with other: SelectorChain) -> Bool {
        return selectors == other.selectors
    }
    
    mutating func mergingExtractors(_ other: SelectorChain) {
        keyedExtractors.merge(other.keyedExtractors, uniquingKeysWith: { lhs, _ in return lhs })
    }
    
    static func convert(pipeline: ProcessingPipeline) -> [SelectorChain] {
        let chains: [SelectorChain] = pipeline.keyedProcessors.map({key, value in
            SelectorChain(processingChain: value, extractorKey: key)
        })
        return [[String] : [SelectorChain]]
            .init(grouping: chains, by: { $0.selectors })
            .reduce(into: [SelectorChain](), { accum, _chains in
            accum.append( _chains.value.reduce(into: SelectorChain(selectors: _chains.key, keyedExtractors: [:]), { $0.mergingExtractors($1) }) )
        })
        
        
    }
}

