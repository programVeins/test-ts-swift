//
// ApiKeysResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ApiKeysResponse: Codable {

    public var keys: [ApiKey]

    public init(keys: [ApiKey]) {
        self.keys = keys
    }


}
