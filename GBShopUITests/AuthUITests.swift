//
//  AuthUITests.swift
//  AuthUITests
//
//  Created by Ekaterina on 8.04.21.
//

import XCTest

class AuthUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginView = app.otherElements["Login"]
        XCTAssertTrue(loginView.waitForExistence(timeout: 1))
        
        let loginField = loginView.textFields["login"]
        XCTAssertTrue(loginField.exists)
        
        let passwordField = loginView.secureTextFields["password"]
        XCTAssertTrue(passwordField.exists)
        
        loginField.tap()
        loginField.typeText("test")
        
        passwordField.tap()
        passwordField.typeText("test")
        
        let loginButton = loginView.buttons["enter"]
        XCTAssertTrue(loginButton.isHittable)
        
        loginButton.tap()
        
        let profileView = app.otherElements["Profile"]
        XCTAssertTrue(profileView.waitForExistence(timeout: 10))
    
    }
    
    func testRegister() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginView = app.otherElements["Login"]
        XCTAssertTrue(loginView.waitForExistence(timeout: 1))
        
        let registerButton = loginView.buttons["register"]
        XCTAssertTrue(registerButton.isHittable)
        
        registerButton.tap()
        
        let profileView = app.otherElements["Profile"]
        XCTAssertTrue(profileView.waitForExistence(timeout: 10))
    
    }

}
