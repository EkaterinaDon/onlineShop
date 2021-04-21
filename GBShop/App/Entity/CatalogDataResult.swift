//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Ekaterina on 14.04.21.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    let user_message: String

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
        case user_message = "user_message"
    }
}

typealias CatalogDataResult = [Product]
