//
//  RegistrationViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 12.04.2022.
//

import UIKit

protocol RegistrationViewInput: AnyObject {
    func showError()
}

class RegistrationViewController: UIViewController {
    private let presenter: RegistrationViewOutput
    private var registrationFormView: RegistrationFormView {
        return view as! RegistrationFormView
    }

    init(presenter: RegistrationViewOutput) {
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
        view = RegistrationFormView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Registration"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_: Bool) {
        registrationFormView.registrationButton.addTarget(self, action: #selector(tapBtnRegistration), for: .touchUpInside)
    }

    @objc
    private func tapBtnRegistration(sender _: UIButton) {
        let userData = RequestUserData(
            userId: 0,
            userName: registrationFormView.loginTextField.text ?? "",
            password: registrationFormView.passwordTextField.text ?? "",
            email: registrationFormView.emailTextField.text ?? "",
            gender: registrationFormView.genderTextField.text ?? "",
            creditCard: registrationFormView.creditCardTextField.text ?? "",
            bio: registrationFormView.bioTextView.text ?? ""
        )
        registrationFormView.registrationButton.showActivity(isShow: true)
        presenter.viewDidTapRegistrationBtn(data: userData)
    }
}

extension RegistrationViewController: RegistrationViewInput {
    func showError() {
        let alert = UIAlertController(title: "Error", message: "registration error!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        registrationFormView.registrationButton.showActivity(isShow: false)
    }
}
