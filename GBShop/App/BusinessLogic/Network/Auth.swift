//
//  Auth.swift
//  GBShop
//
//  Created by Егор Кожемин on 05.03.2022.
//

import Alamofire
import Foundation

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: Login

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"

        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password,
            ]
        }
    }
}

extension Auth: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password: password)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: LogOut

extension Auth {
    struct LogOut: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userId: Int

        var parameters: Parameters? {
            return [
                "id_user": userId,
            ]
        }
    }
}

extension Auth: LogOutRequestFactory {
    func logOut(userId: Int, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void) {
        let requestModel = LogOut(baseUrl: baseUrl, userId: userId)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: Registration

extension Auth {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let userData: RequestUserData

        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

extension Auth: RegistrationRequestFactory {
    func register(user: RequestUserData, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: Change user data

extension Auth {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let userData: RequestUserData

        var parameters: Parameters? {
            return userData.toRequestParam()
        }
    }
}

extension Auth: ChangeUserDataRequestFactory {
    func change(user: RequestUserData, completionHandler: @escaping (AFDataResponse<DefaultResponseResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, userData: user)
        request(request: requestModel, completionHandler: completionHandler)
    }
}
