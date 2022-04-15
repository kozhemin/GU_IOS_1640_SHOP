//
//  UIButton+Ext.swift
//  GBShop
//
//  Created by Егор Кожемин on 12.03.2022.
//

import UIKit

extension UIButton {
    func themeDefault(fontSize: CGFloat = 10) -> UIButton {
        let btn = self
        var config = UIButton.Configuration.filled()

        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
            outgoing.foregroundColor = .white
            return outgoing
        }

        config.buttonSize = .small

        var background = UIButton.Configuration.filled().background
        background.backgroundColor = .pinkColor
        background.strokeColor = .pinkColor

        config.background = background
        btn.configuration = config
        return btn
    }

    func showActivity(isShow: Bool) {
        configuration?.showsActivityIndicator = isShow
    }
}
