//
// Collection.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Collection: Codable {

    /** Name of the collection */
    public var name: String
    /** A list of fields for querying, filtering and faceting */
    public var fields: [Field]
    /** The name of an int32 / float field that determines the order in which the search results are ranked when a sort_by clause is not provided during searching. This field must indicate some kind of popularity. */
    public var defaultSortingField: String
    /** Number of documents in the collection */
    public var numDocuments: Int64

    public init(name: String, fields: [Field], defaultSortingField: String, numDocuments: Int64) {
        self.name = name
        self.fields = fields
        self.defaultSortingField = defaultSortingField
        self.numDocuments = numDocuments
    }

    public enum CodingKeys: String, CodingKey { 
        case name
        case fields
        case defaultSortingField = "default_sorting_field"
        case numDocuments = "num_documents"
    }

}
