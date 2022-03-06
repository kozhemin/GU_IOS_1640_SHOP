//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Alamofire
import Foundation

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
