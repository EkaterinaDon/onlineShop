//
//  RemoveFromBasketRequest.swift
//  GBShop
//
//  Created by Ekaterina on 25.04.21.
//

import Foundation
import Alamofire

class RemoveFromBasketRequest: AbstractRequestFactory {
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

extension RemoveFromBasketRequest: RemoveFromBasketRequestFactory {
    func removeFromBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = RemoveFromBasketRequest(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveFromBasketRequest {
    struct RemoveFromBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeFromBasket"
        let idProduct: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct,
                "quantity" : quantity
            ]
        }
    }
}
