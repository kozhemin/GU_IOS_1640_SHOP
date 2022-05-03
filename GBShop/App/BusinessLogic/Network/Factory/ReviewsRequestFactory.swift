//
//  ReviewsRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 02.04.2022.
//

import Alamofire
import Foundation

protocol ReviewsRequestFactory {
    func list(completionHandler: @escaping (AFDataResponse<Comments>) -> Void)
}
