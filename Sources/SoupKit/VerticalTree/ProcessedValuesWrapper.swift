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
        case section(ProcessedValuesSection)
        case viewModel(ProcessedValuesViewModel)
    }
    
    public let value: Value
    
    public convenience init(section: ProcessedValuesSection, indexPath: IndexPath = [0], parent: ProcessedValuesWrapper? = nil) {
        self.init(value: .section(section), indexPath: indexPath, parent: parent)
    }
    
    public init(value: Value, indexPath: IndexPath, parent: ProcessedValuesWrapper?) {
        self.value = value
        self.indexPath = indexPath
        self.parent = parent
        
        switch value {
        case .section(let section):
            self.nodeTitle = "Section - " + section.source.absoluteString
            self.nodeDescription = section.pipeline.name
            
            let _children = section.viewModels
                .enumerated()
                .map({ProcessedValuesWrapper(value: .viewModel($0.element),
                                             indexPath: indexPath.appending($0.offset),
                                             parent: self)
                })
            
            self.children = _children
        case .viewModel(let model):
            self.nodeTitle = model.title ?? indexPath.description
            let _description = model.userInfo
                .sorted(by: {$0.key < $1.key})
                .map({ " > [\($0.key)] = \($0.value)"})
                .joined(separator: "\n")
            
            self.nodeDescription = _description.isEmpty ? nil : _description
        }
    }
    
}
