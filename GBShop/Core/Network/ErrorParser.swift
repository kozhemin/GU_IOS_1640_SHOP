//
//  ErrorParser.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }

    func parse(response _: HTTPURLResponse?, data _: Data?, error: Error?) -> Error? {
        return error
    }
}
