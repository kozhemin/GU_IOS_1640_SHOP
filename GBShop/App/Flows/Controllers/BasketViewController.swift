//
//  BasketViewController.swift
//  GBShop
//
//  Created by Егор Кожемин on 10.04.2022.
//

import UIKit

class BasketViewController: UIViewController {
    private var basketView: BasketView {
        return view as! BasketView
    }

    init() {
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

    func configureUi() {
        view.backgroundColor = .white
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        let view = BasketView()
        self.view = view
    }
}
