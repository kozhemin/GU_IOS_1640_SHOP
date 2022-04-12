//
//  RegistrationFormView.swift
//  GBShop
//
//  Created by Егор Кожемин on 12.04.2022.
//

import SnapKit
import UIKit

final class RegistrationFormView: UIView {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        return view
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
        textField.placeholder = "Login"
        return textField
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
        textField.placeholder = "Password"
        return textField
    }()

    lazy var emailTextField: UITextField = {
        let iconView = UIImageView(image: UIImage(systemName: "at"))
        iconView.tintColor = .lightGray

        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .gray
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.placeholder = "email"
        return textField
    }()

    lazy var genderTextField: UITextField = {
        let iconView = UIImageView(image: UIImage(systemName: "person.2"))
        iconView.tintColor = .lightGray

        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .gray
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.placeholder = "Gender"
        return textField
    }()

    lazy var creditCardTextField: UITextField = {
        let iconView = UIImageView(image: UIImage(systemName: "creditcard.and.123"))
        iconView.tintColor = .lightGray

        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .gray
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.placeholder = "credit card"
        return textField
    }()

    lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        textView.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textView.textColor = .gray
        return textView
    }()

    lazy var registrationButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 20)
        btn.configuration?.title = "Registration"
        btn.configuration?.buttonSize = .large
        return btn
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

        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(registrationButton)
        contentView.addSubview(genderTextField)
        contentView.addSubview(creditCardTextField)
        contentView.addSubview(bioTextView)

        loginTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        emailTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        genderTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        creditCardTextField.snp.makeConstraints { make -> Void in
            make.top.equalTo(genderTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }

        bioTextView.snp.makeConstraints { make -> Void in
            make.top.equalTo(creditCardTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(120)
        }

        registrationButton.snp.makeConstraints { make -> Void in
            make.top.equalTo(bioTextView.snp.bottom).offset(50)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.bottom.equalTo(scrollView).offset(-inset) // !
        }
    }
}
