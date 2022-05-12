//
//  LoginViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import UIKit
import Firebase

protocol LoginViewInput {
    func showError()
}

class LoginViewController: UIViewController {
    private let presenter: LoginViewOutput
    private var loginFormView: LoginFormView {
        return view as! LoginFormView
    }

    init(presenter: LoginViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        view = LoginFormView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Apple Shop - Auth"
        navigationController?.navigationBar.prefersLargeTitles = true

        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        loginFormView.scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        loginFormView.loginButton.addTarget(self, action: #selector(tapBtnAuth), for: .touchUpInside)
        loginFormView.registerButton.addTarget(self, action: #selector(tapBtnRegister), for: .touchUpInside)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: keyboard avoidance

    @objc
    func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        loginFormView.scrollView.contentInset = contentInsets
        loginFormView.scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc
    func keyboardWillBeHidden(notification _: Notification) {
        let contentInsets = UIEdgeInsets.zero
        loginFormView.scrollView.contentInset = contentInsets
    }

    @objc
    func hideKeyboard() {
        loginFormView.scrollView.endEditing(true)
    }

    @objc
    private func tapBtnAuth(sender _: UIButton) {
        Crashlytics.setLog(log: LogType.btnTapEnterApp)
        
        loginFormView.btnProcess(show: true)
        presenter.viewDidTapAuthBtn(login: loginFormView.loginTextField.text, password: loginFormView.passwordTextField.text)
    }

    @objc
    private func tapBtnRegister(sender _: UIButton) {
        Crashlytics.setLog(log: LogType.tapRegister)
        presenter.viewDidTapRegistrationBtn()
    }
}

extension LoginViewController: LoginViewInput {
    func showError() {
        Crashlytics.setLog(log: LogType.authError)
        
        loginFormView.showAuthError()
        loginFormView.btnProcess(show: false)
    }
}
