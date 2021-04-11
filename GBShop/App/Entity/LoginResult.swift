//
//  LoginResult.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String
}

struct ChangeDataResult: Codable {
    let result: Int
}

struct LogoutResult: Codable {
    let result: Int
}
