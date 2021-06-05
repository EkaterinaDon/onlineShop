//
//  ReviewsResult.swift
//  GBShop
//
//  Created by Ekaterina on 21.04.21.
//

import Foundation

struct ReviewsResult: Codable {
    let pageNumber: Int
    let maxRowsCount: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case maxRowsCount = "max_rows_count"
        case reviews = "reviews"
    }
}

struct Review: Codable {
    let idProduct: Int
    let idUser: Int
    let userName: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idUser = "id_user"
        case userName = "user_name"
        case text = "text"
    }    
}
