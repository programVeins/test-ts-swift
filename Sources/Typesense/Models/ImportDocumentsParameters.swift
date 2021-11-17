//
// ImportDocumentsParameters.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ImportDocumentsParameters: Codable {

    public var action: String?
    public var batchSize: Int?

    public init(action: String? = nil, batchSize: Int? = nil) {
        self.action = action
        self.batchSize = batchSize
    }

    public enum CodingKeys: String, CodingKey { 
        case action
        case batchSize = "batch_size"
    }

}
