//
//  UIButton+Ext.swift
//  TobaccoShop
//
//  Created by Егор Кожемин on 12.03.2022.
//

import UIKit

extension UIButton {
    func themeDefault(fontSize: CGFloat = 10) -> UIButton {
        let btn = self
        var config = UIButton.Configuration.filled()

        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
            outgoing.foregroundColor = .white
            return outgoing
        }

        config.buttonSize = .small

        var background = UIButton.Configuration.filled().background
        background.cornerRadius = 0
        background.backgroundColor = .pinkColor
        background.strokeColor = .pinkColor

        config.background = background
        btn.configuration = config
        return btn
    }
}
