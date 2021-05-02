//
//  RequestFactorys.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

protocol LogoutRequestFactory {
    func logout(id: Int,
                completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

protocol RegisterRequestFactory {
    func registration(userName: String,
                      password: String,
                      email : String,
                      gender: String,
                      cardNumber: String,
                      comment: String,
                      completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}

protocol ChangeDataRequestFactory {
    func changeData(userName: String,
                    password: String,
                    email : String,
                    gender: String,
                    cardNumber: String,
                    comment: String,
                    completionHandler: @escaping (AFDataResponse<ChangeDataResult>) -> Void)
}

protocol CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int,
                        idCategory: Int,
                        completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
}

protocol ProductRequestFactory {
    func getProductBy(id: Int,
                      completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}

protocol ReviewsRequestFactory {
    func getReviews(idProduct: Int,
                    pageNumber: Int,
                    completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void)
}

protocol AddReviewRequestFactory {
    func addReview(idUser: Int,
                   idProduct: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}

protocol RemoveReviewRequestFactory {
    func removeReview(id: Int,
                      completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}

protocol AddToBasketRequestFactory {
    func addToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}

protocol RemoveFromBasketRequestFactory {
    func removeFromBasket(idProduct: Int,
                          quantity: Int,
                          completionHandler: @escaping (AFDataResponse<RemoveFromBasketResult>) -> Void)
}

protocol PayBasketRequestFactory {
    func payBasket(idProduct: Int,
                   quantity: Int,
                   totalSum: Int,
                   completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
