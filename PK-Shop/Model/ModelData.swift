//
//  ModelData.swift
//  PK-Shop
//
//  Created by Trioangle on 03/09/24.
//

import Foundation

class Category: Codable {
    
    let id: Int
    let name: String
    let image: String
    let creationAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case creationAt
        case updatedAt
    }

    init(id: Int, name: String, image: String, creationAt: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.image = image
        self.creationAt = creationAt
        self.updatedAt = updatedAt
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        image = try values.decode(String.self, forKey: .image)
        creationAt = try values.decode(String.self, forKey: .creationAt)
        updatedAt = try values.decode(String.self, forKey: .updatedAt)
    }
}

class Product: Codable {
    
    let id: Int
    let title: String
    let images: [String]
    let description: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case images
        case description
        case price
    }
    
    init(id: Int, title: String, images: [String], description: String, price: Int) {
        self.id = id
        self.title = title
        self.images = images
        self.description = description
        self.price = price
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        images = try values.decode([String].self, forKey: .images)
        description = try values.decode(String.self, forKey: .description)
        price = try values.decode(Int.self, forKey: .price)
    }
}
