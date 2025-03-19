//
//  AlrticleModl.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//


// MARK: - Welcome
struct MyArticle: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: TechcrunchID?
    let name: TechcrunchName?
}

enum TechcrunchID: String, Codable {
    case techcrunch = "techcrunch"
}

enum TechcrunchName: String, Codable {
    case techCrunch = "TechCrunch"
}
