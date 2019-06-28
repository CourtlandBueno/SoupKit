//
//  File.swift
//  
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation
import SwiftSoup

public enum ValueSelectionError: Error {
    case noKeyedExtractors
    case noSelectorChains
    case duplicateChainExtractorKeys
}

public extension SelectorChain {
    func process(_ element: Element) throws -> [String: [String]] {
        guard !keyedExtractors.isEmpty else {
            throw ValueSelectionError.noKeyedExtractors
        }
        var mutableElement: Element? = element
        var elements = Elements([])
        
        for query in selectors {
            if let el = mutableElement {
                defer { mutableElement = nil }
                elements = try el.select(query)
            } else {
                elements = try elements.select(query)
            }
        }
        return try keyedExtractors.mapValues({ extractor in
            if let el = mutableElement {
                return [try extractor.apply(to: el)]
            } else {
                return try extractor.apply(to: elements)
            }
        })
        
        
    }
}
public extension SelectedValues {
    init(payload: DocumentParsingPayload, chains: Set<SelectorChain>) throws {
        guard !chains.isEmpty else {
            throw ValueSelectionError.noSelectorChains
        }
        let allChainExtractorKeys = chains.map({$0.keyedExtractors.keys}).flatMap({$0})
        guard allChainExtractorKeys.count == Set(allChainExtractorKeys).count else {
            throw ValueSelectionError.duplicateChainExtractorKeys
        }
        let doc = try SwiftSoup.parse(payload.html, payload.url.absoluteString)
        
        let vals = try chains
            .map({try $0.process(doc)})
            .reduce(into: [String:[String]](), { $0.merge($1, uniquingKeysWith: {lhs, _ in return lhs}) })
        let _singles = vals.filter({$0.value.count == 1}).mapValues({$0.first!})
        self.singles = _singles
        self.groups = vals.filter({_singles[$0.key] == nil})
        
        
    }
}

