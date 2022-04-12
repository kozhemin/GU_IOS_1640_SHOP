//
//  ProfileViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import SwiftUI
import UIKit

protocol ProfileViewInput: AnyObject {
    func showDataView(user: User)
    func showAlert(message: String)
    func buttonActivity(isShow: Bool)
}

class ProfileViewController: UIViewController {
    private let presenter: ProfileViewOutput
    private var profileView: ProfileView {
        return view as! ProfileView
    }

    init(presenter: ProfileViewOutput) {
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
        view = ProfileView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchUserData()
        profileView.updateProfileButton.addTarget(self, action: #selector(updateProfileTapBtn), for: .touchUpInside)
    }

    @objc
    private func updateProfileTapBtn(sender _: UIButton) {
        presenter.didTapUpdateProfileBtn()
    }
}

extension ProfileViewController: ProfileViewInput {
    func showDataView(user: User) {
        profileView.fillUserData(user: user)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func buttonActivity(isShow: Bool) {
        profileView.updateProfileButton.showActivity(isShow: isShow)
    }
}
