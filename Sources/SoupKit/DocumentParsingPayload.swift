//
//  DocumentParsingPayload.swift
//  ImageDownloader
//
//  Created by Courtland Bueno on 4/26/19.
//  Copyright © 2019 Courtland Bueno. All rights reserved.
//

import Foundation

public struct DocumentParsingPayload: Equatable, Hashable, Codable {
    public var url: URL
    public var html: String
    
    public var isEmpty: Bool {
        return html.isEmpty
    }
    
    public init(url: URL, html: String) {
        self.url = url
        self.html = html
    }
}
