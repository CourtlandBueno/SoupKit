//
//  File.swift
//  
//
//  Created by Courtland Bueno on 6/28/19.
//

import Foundation

public struct SelectedValuesViewModel: Equatable, Hashable, Codable {
    public var userInfo: [String : String]
}


public extension SelectedValuesViewModel {
    var title: String? {
        get { return userInfo["title"] }
        set { userInfo["title"] = newValue }
    }
    
    var detail: String? {
        get { return userInfo["detail"] }
        set { userInfo["detail"] = newValue }
    }
    
    var image: URL? {
        get {
            guard let imageString = userInfo["image"] else {
                return nil
            }
            return URL(string: imageString)
        }
        set { userInfo["image"] = newValue?.absoluteString }
    }
    
    var selection: URL? {
        get {
            guard let imageString = userInfo["selection"] else {
                return nil
            }
            return URL(string: imageString)
        }
        set { userInfo["selection"] = newValue?.absoluteString }
    }
}


public extension SelectedValuesViewModel {
    static var empty: SelectedValuesViewModel {
        return SelectedValuesViewModel(userInfo: [:])
    }
    
    var isEmpty: Bool {
        return userInfo.isEmpty
    }
}
