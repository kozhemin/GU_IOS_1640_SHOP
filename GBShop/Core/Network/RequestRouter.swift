//
//  RequestRouter.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Alamofire
import Foundation

enum RequestRouterEncoding {
    case url, json
}

protocol RequestRouter: URLRequestConvertible {
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}

extension RequestRouter {
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }

    var encoding: RequestRouterEncoding {
        return .url
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue

        switch encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
