//
//  SelectedValuesViewModel.swift
//  SoupKit
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation

public struct SelectedValuesViewModel: Equatable, Hashable, Codable {
    public var userInfo: [String : String]
}

public extension SelectedValuesViewModel {
    static var empty: SelectedValuesViewModel {
        return SelectedValuesViewModel(userInfo: [:])
    }
    
    var isEmpty: Bool {
        return userInfo.isEmpty
    }
}
