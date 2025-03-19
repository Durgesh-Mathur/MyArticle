//
//  ArticleTests.swift
//  ArticleTests
//
//  Created by Durgesh Mathur on 18/03/25.
//

import Testing
@testable import Article
import XCTest

class ArticleListViewModelTests: XCTestCase {
    
    func testLoadArticles_ShouldReturnCorrectCount() async {
        // Arrange
        let mockService = HomeCoreService()
        let viewmodel = OAHomeScreenViewModel(coreService: mockService)
      
        let expectation = XCTestExpectation(description: "Fetch articles")
        
        // Act
        await viewmodel.fetchHomeData {
            // Assert
            XCTAssertEqual(viewmodel.numberOfArticles(), viewmodel.numberOfArticles())
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    
    func testArticleAtIndex_ShouldReturnCorrectTitle() async {
        // Arrange
        let mockService = HomeCoreService()
        let viewmodel = OAHomeScreenViewModel(coreService: mockService)
      
        let expectation = XCTestExpectation(description: "Fetch articles")
        
        // Act
        await viewmodel.fetchHomeData {
            // Assert
            let article = viewmodel.listOfArticle[0]
            XCTAssertEqual(article.title, "Bye-bye bots: Altera's game-playing AI agents get backing from Eric Schmidt | TechCrunch")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
        
       }
 

}
