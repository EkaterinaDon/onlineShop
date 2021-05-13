//
//  RegistrationUITests.swift
//  GBShopUITests
//
//  Created by Ekaterina on 13.05.21.
//

import XCTest

class RegistrationUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginView = app.otherElements["Login"]
        XCTAssertTrue(loginView.waitForExistence(timeout: 1))
        
        let registerButton = loginView.buttons["register"]
        XCTAssertTrue(registerButton.isHittable)
        
        registerButton.tap()
        
        let profileView = app.otherElements["Profile"]
        XCTAssertTrue(profileView.waitForExistence(timeout: 10))
        
        let scrollViewsQuery = profileView.scrollViews
        
        let loginField = scrollViewsQuery.textFields["usersLogin"]
        XCTAssertTrue(loginField.exists)
        loginField.tap()
        loginField.typeText("test")
        
        let passwordField = scrollViewsQuery.textFields["usersPassword"]
        XCTAssertTrue(passwordField.exists)
        passwordField.tap()
        passwordField.typeText("test")
        
        let emailField = scrollViewsQuery.textFields["email"]
        XCTAssertTrue(emailField.exists)
        emailField.tap()
        emailField.typeText("test")
        
        let genderField = scrollViewsQuery.textFields["gender"]
        XCTAssertTrue(genderField.exists)
        genderField.tap()
        genderField.typeText("test")
        
        let cardNumberField = scrollViewsQuery.textFields["cardNumber"]
        XCTAssertTrue(cardNumberField.exists)
        cardNumberField.tap()
        cardNumberField.typeText("test")
        
        let bio = scrollViewsQuery.textViews["bio"]
        XCTAssertTrue(bio.exists)
        bio.tap()
        bio.typeText("test")
        
        
        let saveButton = scrollViewsQuery.buttons["save"]
        saveButton.forceTapElement()
        
        //XCTAssertTrue(profileView.waitForExistence(timeout: 10))
        
//        var alertPressed = false
//        let token = addUIInterruptionMonitor(withDescription: "Description") { (alert)  in
//            alert.buttons["Ok"].tap()
//            alertPressed = true
//            return true
//        }
//        
//        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
//        
//        app.tap()
//        XCTAssert(alertPressed)
//        removeUIInterruptionMonitor(token)
        
    }
    
}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
