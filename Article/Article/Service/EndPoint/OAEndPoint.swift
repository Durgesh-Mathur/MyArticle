

import Foundation

enum OAHost: String {
    case base

    var url: String {
        return switch self {
        case .base : "https://newsapi.org"
        }
    }
}
enum OAEndpoint {
    case topHeadline(sources: String, apiKey: String)
    var method: String {
        return switch self {
        case  .topHeadline: "GET"
        default: "POST"
        }
    }
    
    var retryCount : Int {
        return switch self {
        default : 1
        }
    }
 
}

