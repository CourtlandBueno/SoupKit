//
//  ProcessedValuesSection.swift
//  ImageDownloader
//
//  Created by Courtland Bueno on 4/22/19.
//  Copyright © 2019 Courtland Bueno. All rights reserved.
//

import Foundation
import SwiftSoup

public struct ProcessedValuesSection: Equatable, Hashable, Codable {
    public enum Error: Swift.Error {
        case emptyImageStrings(ProcessedValues)
    }
    
    public let source: URL
    public var pipeline: ProcessingPipeline
    public var viewModels: [ProcessedValuesViewModel]
    
    public init(source: URL, pipeline: ProcessingPipeline, viewModels: [ProcessedValuesViewModel]) {
        self.source = source
        self.pipeline = pipeline
        self.viewModels = viewModels
    }
}

public extension ProcessedValuesSection {
    init(source: URL, pipeline: ProcessingPipeline, element: Element) throws {
        
        
        func zipIfAvailable(values: ProcessedValues) throws -> [ProcessedValuesViewModel] {
            
            let images = values.image
            let titles = values.title
            let details = values.detail
            let selections = values.selection
            
            let count = images.count
            guard count > 0 else {
                throw Error.emptyImageStrings(values)
            }
            var vms = [ProcessedValuesViewModel](repeating: .empty, count: count)
            
            for (offset, value) in images.enumerated() {
                vms[offset].image = URL(string: value)
            }
            
            if titles.count == count {
                for (offset, value) in titles.enumerated() {
                    vms[offset].title = value
                }
            }
            
            if details.count == count {
                for (offset, value) in details.enumerated() {
                    vms[offset].detail = value
                }
            }
            
            if selections.count == count {
                for (offset, value) in selections.enumerated() {
                    vms[offset].selection = URL(string: value)
                }
            }
            
            return vms
        }
        
        self.source = source
        self.pipeline = pipeline
        let values = try pipeline.execute(element)
        
        self.viewModels = try zipIfAvailable(values: values)
        
    }
    
    init(payload: DocumentParsingPayload, pipeline: ProcessingPipeline) throws {
        self = try .init(source: payload.url, pipeline: pipeline, element: try SwiftSoup.parse(payload.html, payload.url.absoluteString))
    }
}

public extension ProcessedValuesSection {
    static let empty = ProcessedValuesSection(source: URL(string: "/")!, pipeline: .empty, viewModels: [])
    
    var isEmpty: Bool {
        return self == .empty
    }
}
