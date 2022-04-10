//
//  BasketPayRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import Alamofire
import Foundation

protocol BasketPayRequestFactory {
    func pay(completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void)
}
