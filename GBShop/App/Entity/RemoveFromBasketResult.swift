//
//  RemoveFromBasketResult.swift
//  GBShop
//
//  Created by Ekaterina on 25.04.21.
//

import Foundation

struct RemoveFromBasketResult: Codable {
    let result: Int
    let message: String
        
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case message = "user_message"
    }
}

