//
// CollectionAlias.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct CollectionAlias: Codable {

    /** Name of the collection alias */
    public var name: String
    /** Name of the collection the alias mapped to */
    public var collectionName: String

    public init(name: String, collectionName: String) {
        self.name = name
        self.collectionName = collectionName
    }

    public enum CodingKeys: String, CodingKey { 
        case name
        case collectionName = "collection_name"
    }

}
