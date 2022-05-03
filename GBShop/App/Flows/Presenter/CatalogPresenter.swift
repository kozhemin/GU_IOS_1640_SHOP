//
//  CatalogPresenter.swift
//  GBShop
//
//  Created by Егор Кожемин on 15.04.2022.
//

import UIKit

protocol CatalogViewOutput: AnyObject {
    func viewDidTapDetailPorudctBtn(good: Good)
    func fetchCatalogData()
}

final class CatalogPresenter {
    weak var viewInput: (UIViewController & CatalogViewInput)?
}

extension CatalogPresenter: CatalogViewOutput {
    func viewDidTapDetailPorudctBtn(good: Good) {
        let detailProductPresenter = DetailProductPresenter()
        let detailProductVc = DetailProductViewController(presenter: detailProductPresenter, good: good)
        detailProductPresenter.viewInput = detailProductVc
        viewInput?.navigationController?.pushViewController(detailProductVc, animated: true)
    }

    func fetchCatalogData() {
        guard let request = requestFactory?.makeCatalogGoodDataFactory() else { return }
        request.getCatalog(pageNumber: 1, categoryId: 1) { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .failure:
                    self?.viewInput?.showError()
                case let .success(catalog):
                    self?.viewInput?.showDataView(products: catalog)
                }
            }
        }
    }
}
