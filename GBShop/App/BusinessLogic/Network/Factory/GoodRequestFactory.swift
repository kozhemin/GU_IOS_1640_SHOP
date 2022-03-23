//
//  GoodRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 24.03.2022.
//

import Alamofire
import Foundation

protocol GoodRequestFactory {
    func getGood(productId: Int, completionHandler: @escaping (AFDataResponse<Good>) -> Void)
}
