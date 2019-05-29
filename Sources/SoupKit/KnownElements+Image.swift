//
//  KnownElements+Image.swift
//  SoupKit iOS
//
//  Created by Courtland Bueno on 4/27/19.
//


#if os(macOS)
import AppKit
public typealias Image = NSImage
#elseif os(iOS)
import UIKit
public typealias Image = UIImage
#endif
import Foundation

class InternalClass {}

extension Bundle {
    static var `default`: Bundle {
        return Bundle.init(for: InternalClass.self)
    }
}

#if os(Linux)
//TODO: add Linux image support

#elseif os(iOS)
public extension KnownElements {
    var image: Image {
        if let image = Image(named: "htmlTag/\(rawValue)", in: Bundle.default, compatibleWith: nil) {
            return image
        } else {
            return Image(named: "htmlTag/empty", in: Bundle.default, compatibleWith: nil)!
        }
    }
}
#elseif os(macOS)
public extension KnownElements {
    var image: Image {
        if let image = Image(named: "htmlTag/\(rawValue)") {
            return image
        } else {
            return Image(named: "htmlTag/empty")!
        }
    }
}

#endif
