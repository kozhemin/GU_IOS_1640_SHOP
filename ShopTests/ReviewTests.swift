//
//  ReviewTests.swift
//  GBShop
//
//  Created by Егор Кожемин on 02.04.2022.
//

import XCTest
@testable import GBShop

class ReviewTests: XCTestCase {
    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testList() throws {
        let exp = expectation(description: "testList")
        let request = requestFactory.makeReviewsFactory()
        
        request.list { response in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testAdd() throws {
        let exp = expectation(description: "testAdd")
        let request = requestFactory.makeReviewAddFactory()
        
        request.add(userId: 1, text: "hello") { response in
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
    
    func testRemove() throws {
        let exp = expectation(description: "testRemove")
        let request = requestFactory.makeReviewRemoveFactory()
        
        request.remove(commentId: 100) { response in
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
