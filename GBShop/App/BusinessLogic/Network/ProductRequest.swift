//
//  ProductRequest.swift
//  GBShop
//
//  Created by Ekaterina on 14.04.21.
//

import Foundation
import Alamofire

class ProductRequest: AbstractRequestFactory {
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

extension ProductRequest: ProductRequestFactory {
    func getProductBy(id: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = ProductRequest(baseUrl: baseUrl, idProduct: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductRequest {
    struct ProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "product"
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct
            ]
        }
    }    
}
