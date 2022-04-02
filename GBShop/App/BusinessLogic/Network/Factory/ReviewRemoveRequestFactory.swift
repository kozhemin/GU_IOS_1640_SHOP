//
//  ReviewRemoveRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 03.04.2022.
//

import Alamofire
import Foundation

protocol ReviewRemoveRequestFactory {
    func remove(commentId: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
