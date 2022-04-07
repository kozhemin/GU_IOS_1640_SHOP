//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Егор Кожемин on 23.03.2022.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        let exp = expectation(description: "testLogin")
        let request = requestFactory.makeAuthRequestFatory()
        
        request.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }

    func testLogOut() throws {
        let exp = expectation(description: "testLogOut")
        let request = requestFactory.makeLogOutRequestFactory()

        request.logOut(userId: 1) { response in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testRegistration() throws {
        let exp = expectation(description: "testRegistration")
        let request = requestFactory.makeRegistrationRequestFactory()
        let userData = RequestUserData.getFakerUserData()

        request.register(user: userData) { response in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testChangeUserData() throws {
        let exp = expectation(description: "testChangeUserData")
        let request = requestFactory.makeChangeUserDataFactory()
        let userData = RequestUserData.getFakerUserData()
        var responseDataAssert: Int = 0
        
        request.change(user: userData) { response in
            switch response.result {
            case let .success(regData):
                responseDataAssert = regData.result
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(responseDataAssert, 1, "We should have response exactly 1.")
    }
}
