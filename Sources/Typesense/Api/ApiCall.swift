//
//  ApiCall.swift
//  
//
//  Created by Sabesh Bharathi on 07/08/21.
//

import Foundation


let APIKEYHEADERNAME = "X-TYPESENSE-API-KEY"

struct ApiCall {
    var nodes: [Node]
    var apiKey: String
    var nearestNode: Node? = nil
    var connectionTimeoutSeconds: Int = 10
    var healthcheckIntervalSeconds: Int = 15
    var numRetries: Int = 3
    var retryIntervalSeconds: Float = 0.1
    var sendApiKeyAsQueryParam: Bool = false
    var currentNodeIndex = -1
    
    init(config: Configuration) {
        self.apiKey = config.apiKey
        self.nodes = config.nodes
        self.nearestNode = config.nearestNode
        self.connectionTimeoutSeconds = config.connectionTimeoutSeconds
        self.healthcheckIntervalSeconds = config.healthcheckIntervalSeconds
        self.numRetries = config.numRetries
        self.retryIntervalSeconds = config.retryIntervalSeconds
        self.sendApiKeyAsQueryParam = config.sendApiKeyAsQueryParam
    }
    
    
    mutating func performRequest(requestType: RequestType, endpoint: String, bodyAsAString: String? = nil, completionHandler: @escaping (String) -> ()) {
        let requestNumber = Date().millisecondsSince1970
        print("Request #\(requestNumber): Performing \(requestType.rawValue) request: /\(endpoint)")
        
        for numTry in 1...self.numRetries + 1 {
            let selectedNode = self.getNextNode(requestNumber: requestNumber)
            print("Request \(requestNumber): Attempting \(requestType.rawValue) request: Try \(numTry) to \(selectedNode)/\(endpoint)")
            
            let urlString = uriFor(endpoint: endpoint, node: selectedNode)
            let url = URL(string: urlString)
            
            let requestHeaders: [String : String] = [APIKEYHEADERNAME: self.apiKey]
            
            var request = URLRequest(url: url!)
            request.allHTTPHeaderFields = requestHeaders
            request.httpMethod = requestType.rawValue
            
            if let httpBody = bodyAsAString {
                request.httpBody = httpBody.data(using: String.Encoding.utf8)
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil {
                    completionHandler(String(decoding: data!, as: UTF8.self))
                }
            }.resume()
            
        }
    }
    
    
    func uriFor(endpoint: String, node: Node) -> String {
        return "\(node.nodeProtocol)://\(node.host):\(node.port)/\(endpoint)"
    }
    
    mutating func getNextNode(requestNumber: Int64 = 0) -> Node {
        if let existingNearestNode = nearestNode {
            print("Nearest Node exists. Updating current node to \(existingNearestNode)")
            return self.nearestNode!
        }
        
        var candidateNode = nodes[0]
        
        print("Nearest Node not found, falling back to nodes")
        
        for _ in 0...nodes.count {
            currentNodeIndex = (currentNodeIndex + 1) % nodes.count
            candidateNode = self.nodes[currentNodeIndex]
            print("Falling back to node \(candidateNode)")
            return candidateNode
        }
        
        return candidateNode
    }
    
}