//
//  ViewController.swift
//  Shop
//
//  Created by Егор Кожемин on 03.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var mainView: MainView {
        return view as! MainView
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
        view.backgroundColor = .blue
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        let view = MainView()
        self.view = view
    }
}
