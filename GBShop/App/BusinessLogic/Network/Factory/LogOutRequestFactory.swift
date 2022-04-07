//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 06.03.2022.
//

import Alamofire
import Foundation

protocol LogOutRequestFactory {
    func logOut(userId: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
