//
//  Logout.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout: LogoutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Exit(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct Exit: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let id: Int
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}
