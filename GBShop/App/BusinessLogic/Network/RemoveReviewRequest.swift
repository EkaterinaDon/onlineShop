//
//  RemoveReviewRequest.swift
//  GBShop
//
//  Created by Ekaterina on 21.04.21.
//

import Foundation
import Alamofire

class RemoveReviewRequest: AbstractRequestFactory {
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

extension RemoveReviewRequest: RemoveReviewRequestFactory {
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReviewRequest(baseUrl: baseUrl, idReview: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReviewRequest {
    struct RemoveReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeReview"
        let idReview: Int
        var parameters: Parameters? {
            return [
                "id_review" : idReview
            ]
        }
    }    
}
