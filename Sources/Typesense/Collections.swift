import Foundation

let RESOURCEPATH = "/collections"

public struct Collections {
    var apiCall: ApiCall
    
    init(config: Configuration) {
        apiCall = ApiCall(config: config)
    }
    
}
