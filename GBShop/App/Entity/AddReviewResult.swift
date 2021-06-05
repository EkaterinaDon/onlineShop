//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Ekaterina on 21.04.21.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let message: String
        
    enum CodingKeys: String, CodingKey {
        case result = "result"        
        case message = "user_message"
    }
}
