
import Foundation

extension OAEndpoint {
    
    var url: URL {
        var baseUrl = OAHost.base
        return URL(string: baseUrl.url + endPoint)!
    }

    var endPoint : String {
        return switch self {
        case .topHeadline: "/v2/top-headlines?sources=techcrunch&apiKey=9787e3a5f2cb48ffa0d005721ad7813d"
        }
    }
    var urlString: String {
        return url.absoluteString
    }
}
