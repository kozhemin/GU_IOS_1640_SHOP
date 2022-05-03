//
//  ProfileView.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import SnapKit
import UIKit

final class ProfileView: UIView {
    let sizeInset: CGFloat = 10

    lazy var userImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "person.circle")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 16)
        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 16)
        return label
    }()

    lazy var lastnameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.getScaledFont(fontName: "Helvetica-Light", fontSize: 16)
        return label
    }()

    lazy var updateProfileButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 16)
        btn.configuration?.title = "Profile update"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
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
        backgroundColor = .white

        addSubview(userImageView)
        addSubview(loginLabel)
        addSubview(nameLabel)
        addSubview(lastnameLabel)
        addSubview(updateProfileButton)

        userImageView.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.lessThanOrEqualTo(self)
            make.width.equalTo(self).multipliedBy(0.5)
            make.height.equalTo(100)
        }

        loginLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(userImageView.snp.bottom).offset(50)
            make.leading.equalTo(sizeInset)
        }

        nameLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.leading.equalTo(sizeInset)
        }

        lastnameLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(sizeInset)
        }

        updateProfileButton.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(lastnameLabel.snp.bottom).offset(50)
            make.width.equalTo(self).multipliedBy(0.8)
        }
    }

    func fillUserData(user: User) {
        loginLabel.text = user.login
        nameLabel.text = user.name
        lastnameLabel.text = user.lastname
    }
}
