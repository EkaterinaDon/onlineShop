//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Ekaterina on 8.04.21.
//

import XCTest
import Alamofire
@testable import GBShop

class GBShopTests: XCTestCase {
    
    var requestFactory: RequestFactory?
    
    override func setUpWithError() throws {
        requestFactory = RequestFactory()
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
    }
    
    func testAuth() {
        let expectation = self.expectation(description: "Авторизация успешна")
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "123", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testRegistration() {
        let expectation = self.expectation(description: "Регистрация успешна")
        let requestFactory = RequestFactory()
        let register = requestFactory.makeRegisterRequestFactory()
        register.registration(userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", cardNumber: "9872389-2424-234224-234", comment: "Hello") { response in
            switch response.result {
            case .success(let register):
                XCTAssertEqual(register.result, 1)
                //XCTAssert(true, register.userMessage)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testLogout() {
        let expectation = self.expectation(description: "Выход успешен")
        let requestFactory = RequestFactory()
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(id: 123) { response in
            switch response.result {
            case .success(let logout):
                XCTAssertEqual(logout.result, 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testChangeData() {
        let expectation = self.expectation(description: "Смена данных успешна")
        let requestFactory = RequestFactory()
        let change = requestFactory.makeChangeDataRequestFactory()
        change.changeData(userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", cardNumber: "9872389-2424-234224-234", comment: "Hello") { response in
            switch response.result {
            case .success(let success):
                XCTAssertEqual(success.result, 1)
                //XCTAssert(true, success.result.description)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCatalogData() {
        let expectation = self.expectation(description: "Получение каталога прошло успешно")
        let requestFactory = RequestFactory()
        let catalog = requestFactory.makeCatalogDataRequestFactory()
        catalog.getCatalogData(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let catalog):
                XCTAssert(true, catalog.description)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testProduct() {
        let expectation = self.expectation(description: "Получение товара")
        let requestFactory = RequestFactory()
        let product = requestFactory.makeProductRequestFactory()
        product.getProductBy(id: 1) { response in
            switch response.result {
            case .success(let product):
                XCTAssertEqual(product.result, 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetReviews() {
        let expectation = self.expectation(description: "Получение списка отзывов")
        let requestFactory = RequestFactory()
        let reviews = requestFactory.makeGetReviewsRequestFatory()
        reviews.getReviews(idProduct: 123, pageNumber: 1) { response in
            switch response.result {
            case .success(let reviews):
                XCTAssert(true, reviews.reviews.description)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testAddReview() {
        let expectation = self.expectation(description: "Добавление отзыва")
        let requestFactory = RequestFactory()
        let addReview = requestFactory.makeAddReviewRequestFatory()
        addReview.addReview(idUser: 123, idProduct: 123, text: "Текст отзыва") { response in
            switch response.result {
            case .success(let review):
                XCTAssertEqual(review.result, 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testRemoveReview() {
        let expectation = self.expectation(description: "Удаление отзыва")
        let requestFactory = RequestFactory()
        let aremoveReview = requestFactory.makeRemoveReviewRequestFatory()
        aremoveReview.removeReview(id: 123) { response in
            switch response.result {
            case .success(let review):
                XCTAssertEqual(review.result, 1)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
