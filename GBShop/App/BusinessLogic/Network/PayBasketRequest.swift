//
//  PayBasketRequest.swift
//  GBShop
//
//  Created by Ekaterina on 25.04.21.
//

import Foundation
import Alamofire

class PayBasketRequest: AbstractRequestFactory {
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

extension PayBasketRequest: PayBasketRequestFactory {
    func payBasket(idProduct: Int, quantity: Int, totalSum: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity, sum: totalSum)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PayBasketRequest {
    struct PayBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payBasket"
        let idProduct: Int
        let quantity: Int
        let sum: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct,
                "quantity" : quantity,
                "totalSum" : sum
            ]
        }
    }
}
