//
//  BasketPresenter.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import UIKit

protocol DetailProductViewOutput: AnyObject {
    func viewDidTapPayBtn()
    func fetchReviewData()
}

final class DetailProductPresenter {
    weak var viewInput: (UIViewController & DetailProductViewInput)?
}

extension DetailProductPresenter: DetailProductViewOutput {
    func fetchReviewData() {
        let request = requestFactory?.makeReviewsFactory()
        guard let request = request else { return }
        request.list { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case let .success(comments):
                    self?.viewInput?.showReview(comments: comments.items)
                case .failure: break
                    self?.viewInput?.showErrorMessage()
                }
            }
        }
    }

    func viewDidTapPayBtn() {
        viewInput?.buttonActivity(isShow: true)
        let request = requestFactory?.makeBasketPayFactory()
        guard let request = request else { return }
        request.pay { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .success:
                    self?.viewInput?.showSuccessMessage()
                    self?.viewInput?.buttonActivity(isShow: false)
                case .failure: break
                    self?.viewInput?.showErrorMessage()
                }
            }
        }
    }
}
