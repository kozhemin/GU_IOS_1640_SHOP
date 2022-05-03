//
//  ReviewViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 17.04.2022.
//

import UIKit

final class ReviewViewController: UIViewController {
    var reviewView: ProductReviewView {
        return view as! ProductReviewView
    }

    var comments = [Comment]() {
        didSet {
            renderReview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = ProductReviewView()
    }

    private func renderReview() {
        comments.forEach { item in
            reviewView.addReview(comment: item)
        }
    }
}
