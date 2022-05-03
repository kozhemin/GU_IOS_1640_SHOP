//
//  ProductViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 17.04.2022.
//

import UIKit

final class ProductViewController: UIViewController {
    var productView: ProductView {
        return view as! ProductView
    }

    private let good: Good

    init(good: Good) {
        self.good = good
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = ProductView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillData(good: good)
    }

    private func fillData(good: Good) {
        productView.imageView.lazyLoadingImage(link: good.imageUrl, contentMode: .scaleAspectFit)
        productView.producnNameLabel.text = good.productName
        productView.productDescriptionLabel.text = ""
        productView.productPriceLabel.text = "\(good.productPrice)$"
    }
}
