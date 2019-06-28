//
//  File.swift
//  
//
//  Created by Courtland Bueno on 6/28/19.
//

import XCTest
@testable import SoupKit
import Foundation


class SelectorChainTests: XCTestCase {
    func testSelectorEquality() {
        let pipeline = ProcessingPipeline.allImages
        
        let imageProcessingChain = pipeline.keyedProcessors["image"]!
        
        let titleProcessingChain = pipeline.keyedProcessors["title"]!
        
        let imageSelectorChain = SelectorChain(processingChain: imageProcessingChain, extractorKey: "image")
        
        let titleSelectorChain = SelectorChain(processingChain: titleProcessingChain, extractorKey: "title")
        
        XCTAssert(imageSelectorChain.hasEquivalentSelectors(with: titleSelectorChain))
    }
    
    func testConversion() {
        let pipeline = ProcessingPipeline.allImages
        let converted = SelectorChain.convert(pipeline: pipeline)
        
        let expectation: [SelectorChain] = [
            .init(selectors: ["img"],
                  keyedExtractors: ["image" : .absUrl(key: "src"), "title" : .attribute(key: "alt")])
        ]
        
        
        XCTAssertEqual(converted, expectation)
        XCTAssert(Set(converted).count == expectation.count)
    }
}
