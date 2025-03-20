//
//  OAService.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//

import Foundation

class HomeCoreService : OACoreServiceProtocol {
    
    private var networkService: OANetworkServiceProtocol
    init(networkService: OANetworkServiceProtocol = OANetworkService()) {
        self.networkService = networkService
        
    }
    
    func fetchTopHeadline(pageNumber: Int) async throws -> MyArticle? {
        let endpoint = OAEndpoint.topHeadline
        do {
            return try await networkService.sendRequest(endpoint: endpoint)
        } catch {
            //              endpoint.logError(error: error)
            throw error
        }
    }
    

}
