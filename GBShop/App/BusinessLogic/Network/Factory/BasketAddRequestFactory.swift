//
//  BasketAddRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import Alamofire
import Foundation

protocol BasketAddRequestFactory {
    func add(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
