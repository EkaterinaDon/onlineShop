//
//  ChangeData.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation
import Alamofire

class ChangeData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension ChangeData: ChangeDataRequestFactory {
    func changeData(userName: String, password: String, email : String, gender: String, cardNumber: String, comment: String, completionHandler: @escaping (AFDataResponse<ChangeDataResult>) -> Void) {
        let requestModel = Changer(baseUrl: baseUrl, login: userName, password: password, id: Int.random(in: 1..<10000), email: email, gender: gender, cardNumber: cardNumber, comment: comment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeData {
    struct Changer: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"//"changeUserData.json"
        
        let login: String
        let password: String
        let id : Int
        let email : String
        let gender : String
        let cardNumber : String
        let comment : String
        var parameters: Parameters? {
            return [
                "id_user" : id,
                "username" : login,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : cardNumber,
                "bio" : comment
            ]
        }
    }
}
