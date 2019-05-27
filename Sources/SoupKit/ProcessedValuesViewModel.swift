//
//  ProcessedValuesViewModel.swift
//  ImageDownloader
//
//  Created by Courtland Bueno on 4/18/19.
//  Copyright © 2019 Courtland Bueno. All rights reserved.
//

import Foundation

public struct ProcessedValuesViewModel: Equatable, Hashable {
    public var userInfo: [String : String]
    
}

public extension ProcessedValuesViewModel {
    var isEmpty: Bool {
        return userInfo.isEmpty
    }
    
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


public extension ProcessedValuesViewModel {
    static var empty: ProcessedValuesViewModel {
        return ProcessedValuesViewModel(userInfo: [:])
    }
}
