//
//  Basket.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import Alamofire
import Foundation

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://stormy-lowlands-19985.herokuapp.com/")!

    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: add to basket

extension Basket {
    struct Add: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "add-to-basket"

        var productId: Int
        var quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
                "quantity": quantity,
            ]
        }
    }
}

extension Basket: BasketAddRequestFactory {
    func add(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void) {
        let requestModel = Add(baseUrl: baseUrl, productId: productId, quantity: quantity)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: delete from basket

extension Basket {
    struct Remove: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "delete-from-basket"

        var productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
            ]
        }
    }
}

extension Basket: BasketRemoveRequestFactory {
    func remove(productId: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void) {
        let requestModel = Remove(baseUrl: baseUrl, productId: productId)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: pay basket

extension Basket {
    struct Pay: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "pay-basket"

        var parameters: Parameters? {
            return nil
        }
    }
}

extension Basket: BasketPayRequestFactory {
    func pay(completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void) {
        let requestModel = Pay(baseUrl: baseUrl)
        request(request: requestModel, completionHandler: completionHandler)
    }
}
