//
//  RegistrationResult.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Foundation

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
