//
//  ProductReviewView.swift
//  GBShop
//
//  Created by Егор Кожемин on 18.04.2022.
//

import SnapKit
import UIKit

final class ProductReviewView: UIView {
    let sizeInset: CGFloat = 20

    lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Reviews"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }

    func addReview(comment: Comment) {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .systemOrange
        label.text = comment.text

        guard let lastView = subviews.last as? UILabel else { return }
        addSubview(label)
        label.snp.makeConstraints { make -> Void in
            make.top.equalTo(lastView.snp.bottom).offset(sizeInset)
            make.leading.equalTo(self).inset(sizeInset)
        }
    }

    private func configureUI() {
        addSubview(captionLabel)

        captionLabel.snp.makeConstraints { make -> Void in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(sizeInset)
            make.leading.equalTo(self).inset(sizeInset)
        }
    }
}
