//
//  KnownAttribute.swift
//  FisherKitExample-MacOS
//
//  Created by Courtland Bueno on 3/13/19.
//
// https://www.w3.org/TR/REC-html40/index/attributes.html

import Foundation

public struct KnownAttribute: Hashable, Codable {
    public var name: String
    public var relatedElements: Set<KnownElements>
    public var valueType: String
    public var description: String
    public var isDepreciated: Bool
    
    public init(name: String, relatedElements: Set<KnownElements>, valueType: String, isDepreciated: Bool, description: String) {
        self.name = name
        self.relatedElements = relatedElements
        self.valueType = valueType
        self.isDepreciated = isDepreciated
        self.description = description
    }
    
    public init(name: String, allElementsBut: Set<KnownElements>, valueType: String, isDepreciated: Bool, description: String) {
        self.name = name
        self.relatedElements = Set(KnownElements.allCases).subtracting(allElementsBut)
        self.valueType = valueType
        self.isDepreciated = isDepreciated
        self.description = description
    }
    
}

extension KnownAttribute {
    
    internal static func parse(tableColumns: [[String]]) -> [KnownAttribute] {
        let names = tableColumns[0]
        
        let related = tableColumns[1].map({ relatedElementsString -> Set<KnownElements> in
            var relatedElementsSet: Set<KnownElements> = []
            switch relatedElementsString {
            case var x where x.hasPrefix("All elements but "):
                if let prefixRange = x.range(of: "All elements but ") {
                    x.removeSubrange(prefixRange)
                    let elements = x.split(separator: Character(","))
                        .map({$0.trimmingCharacters(in: .whitespacesAndNewlines)
                            .lowercased()})
                        .compactMap({KnownElements.init(rawValue: $0)})
                    relatedElementsSet = Set(KnownElements.allCases).subtracting(elements)
                    
                }
            default:
                relatedElementsSet = Set(relatedElementsString.split(separator: Character(",")).map({$0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()}).compactMap({KnownElements.init(rawValue: $0)}))
            }
            return relatedElementsSet
        })
        
        let valueTypes = tableColumns[2]
        let depreciated = tableColumns[3].map({$0 == "D"})
        let descriptions = tableColumns[4]
        
        var attrs: [KnownAttribute] = []
        for (offset, name) in names.enumerated() {
            let _attr = KnownAttribute(name: name,
                                       relatedElements: related[offset],
                                       valueType: valueTypes[offset],
                                       isDepreciated: depreciated[offset],
                                       description: descriptions[offset])
            attrs.append(_attr)
        }
        return attrs
    }
    
    private static let target = Bundle.init(for: InternalClass.self).url(forResource: "known_attributes", withExtension: "plist")!
    
    static let cached = KnownAttribute.Cache.all
    
    static let nameKeyedKnownAttributes = [String:[KnownAttribute]](grouping: cached) { (element) -> String in
        return element.name
    }
    
    static let elementKeyedKnownAttributes = KnownElements.allCases
        .reduce(into: [KnownElements : [KnownAttribute]]()) { (acc, element) in
        acc[element] = cached.filter({ $0.relatedElements.contains(element) })
    }
    
    public static let all: [KnownAttribute] = cached
}
