//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Егор Кожемин on 21.04.2022.
//

import XCTest

class GBShopUITests: XCTestCase {

    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        scrollViewsQuery = app.scrollViews
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessLogin() {
        enterAuthData(login: "admin", password: "password")
        XCTAssertEqual(app.navigationBars["pageTitle"].staticTexts["Catalog"].label, "Catalog")
    }
    
    func testFailedLogin() {
        enterAuthData(login: "admin", password: "")
        let loginTextField = scrollViewsQuery.textFields["login"]
        XCTAssertNotNil(loginTextField)
    }
    
    private func enterAuthData(login: String, password: String) {
        let loginTextField = scrollViewsQuery.textFields["login"]
        
        loginTextField.tap()
        loginTextField.typeText(login)
        
        let passwordTextField = scrollViewsQuery.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
         
        let button = scrollViewsQuery.buttons["enter"]
        button.tap()
    }
}
