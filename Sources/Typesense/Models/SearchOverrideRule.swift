//
// SearchOverrideRule.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SearchOverrideRule: Codable {

    public enum Match: String, Codable { 
        case exact = "exact"
        case contains = "contains"
    }
    /** Indicates what search queries should be overridden */
    public var query: String
    /** Indicates whether the match on the query term should be &#x60;exact&#x60; or &#x60;contains&#x60;. If we want to match all queries that contained the word &#x60;apple&#x60;, we will use the &#x60;contains&#x60; match instead.  */
    public var match: Match

    public init(query: String, match: Match) {
        self.query = query
        self.match = match
    }


}
