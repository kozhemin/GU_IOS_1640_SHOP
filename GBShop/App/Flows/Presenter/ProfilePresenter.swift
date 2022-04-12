//
//  ProfilePresenter.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import UIKit

protocol ProfileViewOutput: AnyObject {
    func fetchUserData()
    func didTapUpdateProfileBtn()
}

final class ProfilePresenter {
    weak var viewInput: (UIViewController & ProfileViewInput)?
}

extension ProfilePresenter: ProfileViewOutput {
    func fetchUserData() {
        // ... some logic getting user data
        let userData = User(id: 1, login: "i.ivanov", name: "Иван", lastname: "Иванов")
        viewInput?.showDataView(user: userData)
    }

    func didTapUpdateProfileBtn() {
        let request = requestFactory?.makeChangeUserDataFactory()
        guard let request = request else { return }
        viewInput?.buttonActivity(isShow: true)

        request.change(user: RequestUserData.getFakerUserData()) { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .success:
                    self?.viewInput?.showAlert(message: "Updated Successfully")
                    self?.viewInput?.buttonActivity(isShow: false)
                case .failure: break
                    self?.viewInput?.showAlert(message: "Error!")
                    self?.viewInput?.buttonActivity(isShow: false)
                }
            }
        }
    }
}
