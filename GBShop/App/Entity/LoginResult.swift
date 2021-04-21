//
//  LoginResult.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user_message: String
    //let user: User
}

struct RegisterResult: Codable {
    let result: Int
    let user_message: String
}

struct ChangeDataResult: Codable {
    let result: Int
    let user_message: String
}

struct LogoutResult: Codable {
    let result: Int
    let user_message: String
}
