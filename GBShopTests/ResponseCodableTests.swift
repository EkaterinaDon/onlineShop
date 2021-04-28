//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Ekaterina on 14.04.21.
//

import XCTest
import Alamofire
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    
    var errorParser: ErrorParserStub!
    
    override func setUpWithError() throws {
        errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        let expectation = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_):
                    expectation.fulfill()
                    break
                case .failure:
                    XCTFail()
                }
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
}

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
