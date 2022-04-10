//
//  BasketView.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import SnapKit
import UIKit

final class BasketView: UIView {
    let sizeInset: CGFloat = 20

    lazy var breadcrumbLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple / Iphone / iPhone 2G".uppercased()
        label.textColor = .pinkColor
        label.font = UIFont(name: "Helvetica", size: 10)
        return label
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()

    lazy var producnNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()

    lazy var payButton: UIButton = {
        let btn = UIButton(type: .system).themeDefault(fontSize: 16)
        btn.configuration?.title = "Pay"
        btn.configuration?.buttonSize = .large
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        btn.addTarget(self, action: #selector(payTapBtn), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    private func setupLayout() {
        addSubview(breadcrumbLabel)
        addSubview(imageView)
        addSubview(producnNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(productPriceLabel)
        addSubview(payButton)

        breadcrumbLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.trailing.equalTo(self).inset(-sizeInset)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(sizeInset)
        }

        imageView.snp.makeConstraints { make -> Void in
            make.top.equalTo(breadcrumbLabel.snp.bottom).offset(sizeInset)
            make.width.equalTo(self.snp.width).offset(-sizeInset)
            make.height.equalTo(self.snp.width).offset(-sizeInset * 2.5)
            make.centerX.equalTo(self)
        }

        producnNameLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(imageView.snp.bottom).offset(sizeInset)
        }

        productDescriptionLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.trailing.equalTo(self).inset(sizeInset)
            make.top.equalTo(producnNameLabel.snp.bottom).offset(sizeInset)
        }

        productPriceLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(sizeInset)
        }

        payButton.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(productPriceLabel.snp.bottom).offset(sizeInset)
            make.width.equalTo(self).multipliedBy(0.8)
        }

        demoData()
    }

    func demoData() {
        imageView.image = UIImage(named: "product_1")
        producnNameLabel.text = "iPhone 2G"
        productDescriptionLabel.text = "iPhone 2G (original) является первой моделью смартфона Apple, который был представлен 9 января 2007 года на ежегодной всемирной выставке MacWorld в Сан-Франциско"
        productPriceLabel.text = "110$"
    }

    @objc
    private func payTapBtn(sender _: UIButton) {
        payButton.configuration?.showsActivityIndicator = true
        let request = requestFactory?.makeBasketPayFactory()
        guard let request = request else { return }
        request.pay { response in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .success:
                    self?.payButton.configuration?.showsActivityIndicator = false
                case .failure: break
                    // ..show payment error
                }
            }
        }
    }
}
