//
//  CrashlyticsLog.swift
//  GBShop
//
//  Created by Егор Кожемин on 23.04.2022.
//

import Firebase
import Foundation

enum LogType: String {
    case btnTapEnterApp = "Попытка входа в приложение"
    case authSuccess = "Успешный вход"
    case authError = "Неуспешный вход"
    case tapRegister = "Форма регистрации"
    case viewCatalog = "Просмотр каталога товаров"
    case viewDetailCatalog = "Просмотр карточки товара"
    case tapPay = "Покупка товара"
    
}

extension Crashlytics {
    static func setLog(log: LogType) {
        self.crashlytics().log(log.rawValue)
    }
}
