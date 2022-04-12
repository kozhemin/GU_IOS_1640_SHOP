//
//  RegistrationPresenter.swift
//  GBShop
//
//  Created by Егор Кожемин on 12.04.2022.
//
import UIKit

protocol RegistrationViewOutput: AnyObject {
    func viewDidTapRegistrationBtn(data: RequestUserData)
}

final class RegistrationPresenter {
    weak var viewInput: (UIViewController & RegistrationViewInput)?
}

extension RegistrationPresenter: RegistrationViewOutput {
    func viewDidTapRegistrationBtn(data: RequestUserData) {
        // ... some validating
        if !validate(data: data) {
            viewInput?.showError()
            return
        }

        guard let request = requestFactory?.makeRegistrationRequestFactory() else { return }
        request.register(user: data) { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .failure:
                    self?.viewInput?.showError()
                case .success:
                    self?.showLoginForm()
                }
            }
        }
    }

    private func validate(data: RequestUserData) -> Bool {
        if data.userName.isEmpty {
            return false
        }

        if data.password.isEmpty {
            return false
        }

        return true
    }

    private func showLoginForm() {
        viewInput?.navigationController?.popViewController(animated: true)
    }
}
