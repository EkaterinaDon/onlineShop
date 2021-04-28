//
//  RequestFactorys.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

protocol LogoutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

protocol RegisterRequestFactory {
    func registration(userName: String, password: String, email : String, gender: String, cardNumber: String, comment: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}

protocol ChangeDataRequestFactory {
    func changeData(userName: String, password: String, email : String, gender: String, cardNumber: String, comment: String, completionHandler: @escaping (AFDataResponse<ChangeDataResult>) -> Void)
}

protocol CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
}

protocol ProductRequestFactory {
    func getProductBy(id: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
