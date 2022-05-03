//
//  ViewController.swift
//  Shop
//
//  Created by Егор Кожемин on 03.03.2022.
//

import UIKit

let cellReuseIdentifier = "ProductCell"

protocol CatalogViewInput {
    func showDataView(products: [Good])
    func showError()
}

final class CatalogViewController: UIViewController {
    let sectionInset: CGFloat = 10
    let itemsPerRow: CGFloat = 2
    let minimumLineSpacing: CGFloat = 30

    private let presenter: CatalogViewOutput

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        return collectionView
    }()

    var productList = [Good]()

    init(presenter: CatalogViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.fetchCatalogData()
        configureUi()
    }

    func configureUi() {
        view.addSubview(collectionView)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.snp.makeConstraints { make -> Void in
            make.edges.equalTo(view)
        }
    }
}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        productList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ProductCollectionViewCell

        let good = productList[indexPath.row]
        myCell.configure(good: good)
        myCell.addToCartButton.tag = indexPath.row
        myCell.addToCartButton.addTarget(self, action: #selector(tapDetailProductBtn), for: .touchUpInside)
        return myCell
    }

    @objc
    private func tapDetailProductBtn(sender: UIButton) {
        let good = productList[sender.tag]
        presenter.viewDidTapDetailPorudctBtn(good: good)
    }
}

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let paddingWidth = sectionInset * (itemsPerRow + 1)
        let availWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.6

        return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        minimumLineSpacing
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        sectionInset
    }
}

extension CatalogViewController: CatalogViewInput {
    func showError() {
        let alert = UIAlertController(title: "Error!", message: "Error data loading...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func showDataView(products: [Good]) {
        productList = products
        collectionView.reloadData()
    }
}
