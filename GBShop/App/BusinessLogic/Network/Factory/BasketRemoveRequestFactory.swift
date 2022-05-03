//
//  BasketRemoveRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import Alamofire
import Foundation

protocol BasketRemoveRequestFactory {
    func remove(productId: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
