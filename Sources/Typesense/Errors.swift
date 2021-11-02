import Foundation

public enum HTTPError: Error {
    case serverError(code: Int, desc: String)
}
