//
//  AppDelegate.swift
//  Shop
//
//  Created by Егор Кожемин on 03.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let requestFactory = RequestFactory()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startTestCase()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func startTestCase() {
        testRegistration()
        testLogin()
        testChangeUserData()
        testLogOut()
    }

    private func testLogin() {
        let request = requestFactory.makeAuthRequestFatory()

        request.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case let .success(login):
                print("testLogin: ", login)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func testLogOut() {
        let request = requestFactory.makeLogOutRequestFactory()

        request.logOut(userId: 1) { response in
            switch response.result {
            case let .success(logOut):
                print("testLogOut ", logOut)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func testRegistration() {
        let request = requestFactory.makeRegistrationRequestFactory()
        let userData = RequestUserData.getFakerUserData()

        request.register(user: userData) { response in
            switch response.result {
            case let .success(regData):
                print("testRegistration ", regData)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func testChangeUserData() {
        let request = requestFactory.makeChangeUserDataFactory()
        let userData = RequestUserData.getFakerUserData()

        request.change(user: userData) { response in
            switch response.result {
            case let .success(regData):
                print("testChangeUserData ", regData)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
