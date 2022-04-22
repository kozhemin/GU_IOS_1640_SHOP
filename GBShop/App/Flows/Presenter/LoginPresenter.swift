//
//  LoginPresenter.swift
//  Ooptika
//
//  Created by Егор Кожемин on 31.03.2022.
//

import UIKit
import Firebase

protocol LoginViewOutput: AnyObject {
    func viewDidTapAuthBtn(login: String?, password: String?)
    func viewDidTapRegistrationBtn()
}

final class LoginPresenter {
    weak var viewInput: (UIViewController & LoginViewInput)?
}

extension LoginPresenter: LoginViewOutput {
    func viewDidTapRegistrationBtn() {
        let registrationPresenter = RegistrationPresenter()
        let registrationVc = RegistrationViewController(presenter: registrationPresenter)
        registrationPresenter.viewInput = registrationVc
        viewInput?.navigationController?.pushViewController(registrationVc, animated: true)
    }

    func viewDidTapAuthBtn(login: String?, password: String?) {
        guard let login = login, let password = password else {
            viewInput?.showError()
            return
        }

        if login.isEmpty || password.isEmpty {
            viewInput?.showError()
            return
        }

        guard let request = requestFactory?.makeAuthRequestFatory() else { return }
        request.login(userName: login, password: password) { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .failure:
                    self?.viewInput?.showError()
                case .success:
                    self?.successLogin()
                    Crashlytics.setLog(log: LogType.authSuccess)
                }
            }
        }
    }

    private func successLogin() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewInput?.present(vc, animated: true, completion: nil)
    }
}
