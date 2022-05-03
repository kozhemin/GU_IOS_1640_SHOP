//
//  BasketViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import UIKit

protocol BasketViewInput: AnyObject {
    func buttonActivity(isShow: Bool)
    func showError()
}

class BasketViewController: UIViewController {
    private let presenter: BasketViewOutput
    private var basketView: BasketView {
        return view as! BasketView
    }

    init(presenter: BasketViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
    }

    override func viewWillAppear(_: Bool) {
        basketView.payButton.addTarget(self, action: #selector(payTapBtn), for: .touchUpInside)
    }

    func configureUi() {
        view.backgroundColor = .white
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        let view = BasketView()
        self.view = view
    }

    @objc
    private func payTapBtn(sender _: UIButton) {
        presenter.viewDidTapPayBtn()
    }
}

extension BasketViewController: BasketViewInput {
    func buttonActivity(isShow: Bool) {
        basketView.payButton.showActivity(isShow: isShow)
    }

    func showError() {
        print("... show payment error")
    }
}
