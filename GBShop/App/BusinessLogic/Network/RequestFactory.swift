//
//  RequestFactory.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeRegisterRequestFactory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeChangeDataRequestFactory() -> ChangeDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeCatalogDataRequestFactory() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    
    func makeProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
}
