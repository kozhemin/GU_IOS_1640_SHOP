//
//  BasketPresenter.swift
//  GBShop
//
//  Created by Егор Кожемин on 11.04.2022.
//

import UIKit

protocol BasketViewOutput: AnyObject {
    func viewDidTapPayBtn()
}

final class BasketPresenter {
    weak var viewInput: (UIViewController & BasketViewInput)?
}

extension BasketPresenter: BasketViewOutput {
    func viewDidTapPayBtn() {
        viewInput?.buttonActivity(isShow: true)
        let request = requestFactory?.makeBasketPayFactory()
        guard let request = request else { return }
        request.pay { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .success:
                    self?.viewInput?.buttonActivity(isShow: false)
                case .failure: break
                    self?.viewInput?.showError()
                }
            }
        }
    }
}
