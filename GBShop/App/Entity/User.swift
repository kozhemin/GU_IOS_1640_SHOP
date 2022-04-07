//
//  User.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Alamofire
import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}

struct RequestUserData {
    var userId: Int
    var userName: String
    var password: String
    var email: String
    var gender: String
    var creditCard: String
    var bio: String
}

extension RequestUserData {
    func toRequestParam() -> Parameters {
        return [
            "id_user": userId,
            "username": userName,
            "email": email,
            "gender": gender,
            "credit_card": creditCard,
            "bio": bio,
        ]
    }
}

// MARK: Demo user data

extension RequestUserData {
    static func getFakerUserData() -> Self {
        return RequestUserData(
            userId: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "email",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        )
    }
}
