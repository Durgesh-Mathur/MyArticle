//
//  Untitled.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//
import Foundation

class ArticleViewModel {
 
    private let coreService: OACoreServiceProtocol

    var listOfArticle: [Article] = []
    var currentPage = 0
    init(coreService: OACoreServiceProtocol = ArticleService()) {
        self.coreService = coreService
    }
    
    // Fetch data on appear
    func fetchHomeData(completion: () -> ()) async {
        do {
            let homeData = try await coreService.fetchTopHeadline(pageNumber: currentPage + 1)
            print(homeData)
            listOfArticle.append(contentsOf: homeData?.articles ?? [])
            completion()
        } catch {
            currentPage = currentPage - 1
            if (error as? URLError)?.code != .cancelled {
                print("Failed to fetch data: \(error.localizedDescription)")
            }
        }

    }
    
    func numberOfArticles() -> Int {
           return listOfArticle.count
       }
    
}

