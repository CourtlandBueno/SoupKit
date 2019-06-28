//
//  SelectedValuesSection.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation
import SwiftSoup

public struct SelectedValuesSection: Equatable, Hashable, Codable {
    
    public let source: URL
    public var chains: Set<SelectorChain>
    public var sectionInfo: [String : String]
    public var viewModels: [SelectedValuesViewModel]
    
    public init(source: URL, chains: Set<SelectorChain>, sectionInfo: [String : String], viewModels: [SelectedValuesViewModel]) {
        self.source = source
        self.chains = chains
        self.sectionInfo = sectionInfo
        self.viewModels = viewModels
    }
}

public extension SelectedValuesSection {
    
    static let empty = SelectedValuesSection(source: URL(string: "/")!, chains: [], sectionInfo: [:], viewModels: [])
    
    var isEmpty: Bool {
        return self == .empty
    }
    
    init(payload: DocumentParsingPayload, chains: Set<SelectorChain>) throws {
        let values = try SelectedValues(payload: payload, chains: chains)
        
        let countGroupedValues = [Int : [(key: String, value: [String])]].init(grouping: values.groups, by: {$0.value.count})
        guard let max = countGroupedValues.max(by: {$0.value.count < $1.value.count}).map({$0.value}),
            let maxCount = max.map({$0.value.count}).first else {
                self = .init(source: payload.url, chains: chains, sectionInfo: [:], viewModels: [])
                return
        }
        var vms = [SelectedValuesViewModel](repeating: .empty, count: maxCount)
        max.enumerated().forEach({ groupOffset, element in
            for (offset, value) in element.value.enumerated() {
                vms[offset].userInfo[element.key] = value
            }
        })
        self = .init(source: payload.url, chains: chains, sectionInfo: values.singles, viewModels: vms)
    }
}


