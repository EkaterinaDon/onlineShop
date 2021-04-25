//
//  AddToBasketRequest.swift
//  GBShop
//
//  Created by Ekaterina on 25.04.21.
//

import Foundation
import Alamofire

class AddToBasketRequest: AbstractRequestFactory {
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

extension AddToBasketRequest: AddToBasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasketRequest(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddToBasketRequest {
    struct AddToBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addToBasket"
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
