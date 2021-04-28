//
//  CatalogData.swift
//  GBShop
//
//  Created by Ekaterina on 14.04.21.
//

import Foundation
import Alamofire

class CatalogData: AbstractRequestFactory {
    
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

extension CatalogData: CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void) {
        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)        
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CatalogData {
    struct CatalogData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number" : pageNumber,
                "id_category" : idCategory
            ]
        }
    }
}
