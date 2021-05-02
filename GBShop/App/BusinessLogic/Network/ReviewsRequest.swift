//
//  ReviewsRequest.swift
//  GBShop
//
//  Created by Ekaterina on 21.04.21.
//

import Foundation
import Alamofire

class ReviewsRequest: AbstractRequestFactory {
    
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

extension ReviewsRequest: ReviewsRequestFactory {
    func getReviews(idProduct: Int,
                    pageNumber: Int,
                    completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void) {
        let requestModel = ReviewsRequest(baseUrl: baseUrl, idProduct: idProduct, pageNumber: pageNumber)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewsRequest {    
    struct ReviewsRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "reviews"
        let idProduct: Int
        let pageNumber: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct,
                "page_number" : pageNumber
            ]
        }
    }    
}
