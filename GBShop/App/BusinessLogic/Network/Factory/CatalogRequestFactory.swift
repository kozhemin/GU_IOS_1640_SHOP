//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Егор Кожемин on 24.03.2022.
//

import Alamofire
import Foundation

protocol CatalogRequestFactory {
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[Good]>) -> Void)
}
