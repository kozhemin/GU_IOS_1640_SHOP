//
//  BasketViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import SnapKit
import UIKit
import Firebase

protocol DetailProductViewInput: AnyObject {
    func buttonActivity(isShow: Bool)
    func showErrorMessage()
    func showSuccessMessage()
    func showReview(comments: [Comment])
}

class DetailProductViewController: UIViewController {
    var good: Good

    private let presenter: DetailProductViewOutput
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    lazy var productViewController = ProductViewController(good: good)
    lazy var productReviewController = ReviewViewController()

    lazy var contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()

    init(presenter: DetailProductViewOutput, good: Good) {
        self.presenter = presenter
        self.good = good
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.fetchReviewData()
        configureUi()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productViewController.productView.payButton.addTarget(self, action: #selector(payTapBtn), for: .touchUpInside)
    }

    func configureUi() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        addProductViewController()
        addReviewViewController()

        makeConstraints()
    }

    private func addProductViewController() {
        addChild(productViewController)
        contentView.addArrangedSubview(productViewController.view)
        productViewController.didMove(toParent: self)
    }

    private func addReviewViewController() {
        addChild(productReviewController)
        contentView.addArrangedSubview(productReviewController.view)
        productReviewController.didMove(toParent: self)
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make -> Void in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }

        productViewController.view.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)

            make.height.equalTo(600) // @todo!
        }

        productReviewController.view.snp.makeConstraints { make in
            make.top.equalTo(productViewController.view.snp.bottom).offset(20)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.equalTo(200) // @todo!

            make.bottom.equalTo(scrollView).offset(-10) // !
        }
    }

    @objc
    private func payTapBtn(sender _: UIButton) {
        Crashlytics.setLog(log: LogType.tapPay)
        presenter.viewDidTapPayBtn()
    }
}

extension DetailProductViewController: DetailProductViewInput {
    func showReview(comments: [Comment]) {
        productReviewController.comments = comments
    }

    func buttonActivity(isShow: Bool) {
        productViewController.productView.payButton.showActivity(isShow: isShow)
    }

    func showErrorMessage() {
        print("... show payment error")
    }

    func showSuccessMessage() {
        let alert = UIAlertController(title: "Success!", message: "Payment made!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
