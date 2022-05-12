//
//  LoginFormView.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import SnapKit
import UIKit

final class LoginFormView: UIView {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var logoImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()

    lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 20)
        btn.configuration?.title = "Enter"
        btn.configuration?.buttonSize = .large
        btn.accessibilityIdentifier = "enter"
        return btn
    }()

    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Registration", for: .normal)
        btn.setTitleColor(.systemGray, for: .normal)
        btn.tintColor = .systemGray
        btn.titleLabel!.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 14)
        return btn
    }()

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "login".uppercased()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 12)
        return label
    }()

    lazy var loginTextField: UITextField = {
        let iconView = UIImageView(image: UIImage(systemName: "person"))
        iconView.tintColor = .lightGray

        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .gray
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.accessibilityIdentifier = "login"
        return textField
    }()

    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "password".uppercased()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 12)
        return label
    }()

    lazy var passwordTextField: UITextField = {
        let iconView = UIImageView(image: UIImage(systemName: "lock"))
        iconView.tintColor = .lightGray

        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .gray
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.accessibilityIdentifier = "password"
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    private func configureUI() {
        let inset = 20
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        contentView.snp.makeConstraints { make -> Void in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }

        contentView.addSubview(logoImageView)
        contentView.addSubview(loginLabel)
        contentView.addSubview(loginTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(registerButton)

        logoImageView.snp.makeConstraints { make -> Void in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.centerX.lessThanOrEqualTo(contentView)
            make.width.equalTo(scrollView).multipliedBy(0.3)
            make.height.equalTo(100)
        }

        loginTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(logoImageView.snp.bottom).offset(100)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        loginLabel.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(loginTextField.snp.top).offset(-5)
            make.leading.equalTo(contentView).offset(inset + 5)
        }

        passwordLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset + 5)
        }

        passwordTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        loginButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
        }

        registerButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.centerX.equalTo(contentView)

            make.bottom.equalTo(scrollView).offset(-inset) // !
        }
    }
}

extension LoginFormView {
    func showAuthError() {
        loginTextField.leftView?.tintColor = .red
        passwordTextField.leftView?.tintColor = .red
        loginTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.text = ""
    }

    func btnProcess(show: Bool) {
        loginButton.configuration?.showsActivityIndicator = show
        loginButton.isEnabled = !show
    }
}
