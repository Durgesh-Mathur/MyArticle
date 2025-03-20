//
//  OAService.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//

import Foundation

let apiKey: String = "9787e3a5f2cb48ffa0d005721ad7813d"

class ArticleService : OACoreServiceProtocol {
    
    private var networkService: OANetworkServiceProtocol
    init(networkService: OANetworkServiceProtocol = OANetworkService()) {
        self.networkService = networkService
        
    }
    
    func fetchTopHeadline(pageNumber: Int) async throws -> MyArticle? {
        let endpoint = OAEndpoint.topHeadline(sources: "techcrunch", apiKey: apiKey)
        do {
            return try await networkService.sendRequest(endpoint: endpoint)
        } catch {
            //              endpoint.logError(error: error)
            throw error
        }
    }
    

}
