//
//  VerticalTreeExt.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/2/19.
//
//
import Foundation
import VerticalTree

public final class ProcessedValuesWrapper: VerticalTreeNode, Infomation {
    public var length: TreeNodeLength = .indexLength(80)

    public let indexPath: IndexPath

    weak public var parent: ProcessedValuesWrapper?

    public var children: [ProcessedValuesWrapper] = []

    public var info: Infomation { return self }

    public var nodeTitle: String = ""

    public var nodeDescription: String? = nil

    public var childs: [ProcessedValuesWrapper] {
        return children
    }

    public var isFold: Bool = false

    public enum Value {
        case root(pipeline: ProcessingPipeline, sections: [ProcessedValuesSection])
        case section(ProcessedValuesSection)
        case viewModel(ProcessedValuesViewModel)
    }
    
    public let value: Value
    
    public convenience init(pipeline: ProcessingPipeline, sections: [ProcessedValuesSection]) {
        self.init(value: .root(pipeline: pipeline, sections: sections), indexPath: [0], parent: nil)
    }
    
    public convenience init(section: ProcessedValuesSection, indexPath: IndexPath = [0], parent: ProcessedValuesWrapper? = nil) {
        self.init(value: .section(section), indexPath: indexPath, parent: parent)
    }
    
    public init(value: Value, indexPath: IndexPath, parent: ProcessedValuesWrapper?) {
        self.value = value
        self.indexPath = indexPath
        self.parent = parent
        
        switch value {
        case .root(pipeline: let pipeline, sections: let sections):
            self.nodeTitle = "\(sections.count) sections - pipeline name: `\(pipeline.name)`"
            
            self.nodeDescription = pipeline.keyedProcessors
                .sorted(by: {$0.key < $1.key})
                .map({ " > [\($0.key)] = \($0.value)"})
                .joined(separator: "\n")
            
            let _children = sections
                .enumerated()
                .map({ProcessedValuesWrapper(section: $0.element,
                                             indexPath: indexPath.appending($0.offset),
                                             parent: self)})
            self.children = _children
            
        case .section(let section):
            let childCount = section.viewModels.count
            self.nodeTitle = "\(indexPath) - Section - " + section.source.absoluteString
            
            self.nodeDescription = [
                "Source: \(section.source.absoluteString)",
                "Count: \(childCount)"
                ].map({ " > \($0)"})
                .joined(separator: "\n")
            
            let _children = section.viewModels
                .enumerated()
                .map({ProcessedValuesWrapper(value: .viewModel($0.element),
                                             indexPath: indexPath.appending($0.offset),
                                             parent: self)
                })
            
            self.children = _children
            
        case .viewModel(let model):
            self.nodeTitle = indexPath.description + " '\(model.title ?? "")'"
            let _description = model.userInfo
                .sorted(by: {$0.key < $1.key})
                .map({ " > [\($0.key)] = \($0.value)"})
                .joined(separator: "\n")
            
            self.nodeDescription = _description.isEmpty ? nil : _description
        }
    }
    
}
