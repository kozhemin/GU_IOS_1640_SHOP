//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Alamofire
import Foundation

protocol RegistrationRequestFactory {
    func register(user: RequestUserData, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void)
}
