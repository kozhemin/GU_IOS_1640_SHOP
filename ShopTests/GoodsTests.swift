//
//  GoodsTests.swift
//  GBShopTests
//
//  Created by Егор Кожемин on 24.03.2022.
//

import XCTest
@testable import GBShop

class GoodsTests: XCTestCase {
    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetGood() throws {
        let exp = expectation(description: "testGetGood")
        let request = requestFactory.makeGoodRequestFactory()
        var responseProductName = ""
        
        request.getGood(productId: 1) { response in
            switch response.result {
            case let .success(resp):
                responseProductName = resp.productName
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
        
        XCTAssertEqual(responseProductName, "Ноутбук")
    }
    
    func testGetGoodCatalog() throws {
        let exp = expectation(description: "testGetGoodCatalog")
        let request = requestFactory.makeCatalogGoodDataFactory()
        var countResult = 0
        
        request.getCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case let .success(resp):
                countResult = resp.count
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: timeout)
        
        XCTAssertGreaterThan(countResult, 0, "We should have response greater than 0.")
    }

}
