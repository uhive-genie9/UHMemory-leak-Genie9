//
//  GIFModel.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/18/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation

struct GIFAnonymousIDModel: Codable {
    var anonymousID: String
    
    enum CodingKeys: String, CodingKey {
        case anonymousID = "anon_id"
    }
}

struct GIFCategoryItem: Codable, Configurable, Cacheable {
    static let databaseTableName = TableName.GIFCategories.rawValue

    var item: String

}

class GIFCategoriesModel: Codable, Configurable {
    var items: [GIFCategoryItem]? {
       results.insert("Trending", at: 0)
       return results.map{GIFCategoryItem(item: $0)}
    }
    
    private var results: [String]

    enum MyCodingKeys: String, CodingKey {
        case results = "results"        
    }
}

struct GIFResponseModel: Codable, Configurable {
    let results: [GIFItemModel]
    let next: String
}

// MARK: - Result
struct GIFItemModel: Codable, Configurable {
    let tags: [String]?
    let url: String
    let media: [GIFMediaModel]
    let shares: Int
    let itemUrl: String
    let title: String
    let id: String
    enum CodingKeys: String, CodingKey {
        case itemUrl = "itemurl", tags, url, media, shares, title, id
    }
}

// MARK: - Media
struct GIFMediaModel: Codable, Configurable {
    let tinyGif, gif, mp4: GIFFormatModel
    enum CodingKeys: String, CodingKey {
        case tinyGif = "tinygif", gif, mp4
    }
}

// MARK: - GIF
struct GIFFormatModel: Codable, Configurable {
    let url: String
    let dims: [Int]
    let preview: String
    let size: Int
    let duration: Double?
}
