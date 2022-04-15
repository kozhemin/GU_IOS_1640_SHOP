//
//  TabBarViewController.swift
//  Ooptika
//
//  Created by Егор Кожемин on 06.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupVCs()
    }

    private func configureUI() {
        view.backgroundColor = .white
    }

    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationItem.largeTitleDisplayMode = .automatic
        rootViewController.navigationItem.title = title
        rootViewController.title = title
        return navController
    }

    func setupVCs() {
        let profilePresenter = ProfilePresenter()
        let profileViewController = ProfileViewController(presenter: profilePresenter)
        profilePresenter.viewInput = profileViewController

        let catalogPresenter = CatalogPresenter()
        let catalogViewController = CatalogViewController(presenter: catalogPresenter)
        catalogPresenter.viewInput = catalogViewController

        viewControllers = [
            createNavController(
                for: catalogViewController,
                title: NSLocalizedString("Catalog", comment: ""),
                image: UIImage(systemName: "note.text")!
            ),
            createNavController(
                for: profileViewController,
                title: NSLocalizedString("Profile", comment: ""),
                image: UIImage(systemName: "person.circle")!
            ),
        ]
    }
}
