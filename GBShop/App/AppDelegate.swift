//
//  AppDelegate.swift
//  GBShop
//
//  Created by Ekaterina on 8.04.21.
//

import UIKit

import Firebase
import FirebaseAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
//        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
//          AnalyticsParameterItemID: "id",
//          AnalyticsParameterContentType: "cont"
//          ])

        
//        let auth = requestFactory.makeAuthRequestFactory()
//        auth.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

//        let register = requestFactory.makeRegisterRequestFactory()
//        register.registration(userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", cardNumber: "9872389-2424-234224-234", comment: "Hello") { response in
//            switch response.result {
//            case .success(let register):
//                print(register)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

//        let changeData = requestFactory.makeChangeDataRequestFactory()
//        changeData.changeData(userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", cardNumber: "9872389-2424-234224-234", comment: "Hello") { response in
//            switch response.result {
//            case .success(let changed):
//                print(changed)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(id: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
                Analytics.logEvent(AnalyticsEventSignUp, parameters: [AnalyticsParameterSignUpMethod: "Logout"])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

//        let catalog = requestFactory.makeCatalogDataRequestFactory()
//        catalog.getCatalogData(pageNumber: 1, idCategory: 1) { response in
//            switch response.result {
//            case .success(let catalog):
//                print(catalog)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

//        let product = requestFactory.makeProductRequestFactory()
//        product.getProductBy(id: 123) { (response) in
//            switch response.result {
//            case .success(let product):
//                print(product)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

//        let reviews = requestFactory.makeGetReviewsRequestFactory()
//        reviews.getReviews(idProduct: 123, pageNumber: 1) { (response) in
//            switch response.result {
//            case .success(let reviews):
//                print(reviews)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

        let addReview = requestFactory.makeAddReviewRequestFactory()
        addReview.addReview(idUser: 123, idProduct: 123, text: "Текст отзыва") { (response) in
            switch response.result {
            case .success(let review):
                print(review)
                Analytics.logEvent("Add review", parameters: [AnalyticsParameterSuccess: ""])
            case.failure(let error):
                print(error.localizedDescription)
            }
        }

        let removeReview = requestFactory.makeRemoveReviewRequestFactory()
        removeReview.removeReview(id: 123) { (response) in
            switch response.result {
            case .success(let review):
                print(review)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
//        let addToBasket = requestFactory.makeAddToBasketRequestFactory()
//        addToBasket.addToBasket(idProduct: 123, quantity: 2) { (response) in
//            switch response.result {
//            case .success(let addSuccess):
//                print(addSuccess)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
//        let removeFromBasket = requestFactory.makeRemoveFromBasketRequestFactory()
//        removeFromBasket.removeFromBasket(idProduct: 123, quantity: 2) { (response) in
//            switch response.result {
//            case .success(let removeSuccess):
//                print(removeSuccess)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }

//        let payBasket = requestFactory.makePayBasketRequestFactory()
//        payBasket.payBasket(idProduct: 123, quantity: 1, totalSum: 100) { (response) in
//            switch response.result {
//            case .success(let paymentSuccess):
//                print(paymentSuccess)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

