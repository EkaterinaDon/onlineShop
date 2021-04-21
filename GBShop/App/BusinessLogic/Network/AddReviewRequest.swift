//
//  AddReviewRequest.swift
//  GBShop
//
//  Created by Ekaterina on 21.04.21.
//

import Foundation
import Alamofire

class AddReviewRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
        
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility),
         baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
    
}

extension AddReviewRequest: AddReviewRequestFactory {
    func addReview(idUser: Int, idProduct: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReviewRequest(baseUrl: baseUrl, idUser: idUser, idProduct: idProduct, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReviewRequest {
    struct AddReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        let idUser: Int
        let idProduct: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user" : idUser,
                "id_product" : idProduct,
                "text" : text
            ]
        }
    }    
}
