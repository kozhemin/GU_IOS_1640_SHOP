//
//  BasketTests.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import XCTest
@testable import GBShop

class BasketTests: XCTestCase {
    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() throws {
        let exp = expectation(description: "testAdd")
        let request = requestFactory.makeBasketAddFactory()
        
        request.add(productId: 1, quantity: 2) { response in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testRemove() throws {
        let exp = expectation(description: "testRemove")
        let request = requestFactory.makeBasketRemoveFactory()
        
        request.remove(productId: 1) { response in
            print(response)
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testPay() throws {
        let exp = expectation(description: "testPay")
        let request = requestFactory.makeBasketPayFactory()
        
        request.pay { response in
            print(response)
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
}
