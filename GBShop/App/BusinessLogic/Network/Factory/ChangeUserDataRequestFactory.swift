//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 06.03.2022.
//

import Alamofire
import Foundation

protocol ChangeUserDataRequestFactory {
    func change(user: RequestUserData, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
