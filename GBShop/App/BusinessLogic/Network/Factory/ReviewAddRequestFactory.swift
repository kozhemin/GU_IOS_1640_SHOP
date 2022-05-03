//
//  ReviewAddRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 02.04.2022.
//

import Alamofire
import Foundation

protocol ReviewAddRequestFactory {
    func add(userId: Int, text: String, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
