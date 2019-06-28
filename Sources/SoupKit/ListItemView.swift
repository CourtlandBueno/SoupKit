//
//  ListItemView.swift
//  
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation

public struct ListItemView: Equatable, Hashable, Codable {
    public var title: String?
    public var detail: String?
    public var image: URL?
    public var selection: URL?
    
    public init(_ viewModel: SelectedValuesViewModel) {
        let userInfo = viewModel.userInfo
        
        self.title = userInfo["title"]
        self.detail = userInfo["detail"]
        if let imageString = userInfo["image"] {
            self.image = URL(string: imageString)
        } else {
            self.image = nil
        }
        if let selectionString = userInfo["selection"] {
            self.selection = URL(string: selectionString)
        } else {
            self.selection = nil
        }
    }
}

public extension SelectedValuesViewModel {
    var ListItemView: ListItemView {
        get { .init(self) }
        set {
            userInfo["title"] = newValue.title
            userInfo["detail"] = newValue.detail
            userInfo["image"] = newValue.image?.absoluteString
            userInfo["selection"] = newValue.selection?.absoluteString
        }
    }
}
