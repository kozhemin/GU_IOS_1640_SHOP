//
//  UIFont+ext.swift
//  GBShop
//
//  Created by Егор Кожемин on 31.03.2022.
//

import UIKit

extension UIFont {
    static func getScaledFont(fontName: String, fontSize: CGFloat = UIFont.labelFontSize) -> UIFont? {
        let font = UIFont(name: fontName, size: fontSize)
        if let scaledFont = font {
            return UIFontMetrics(forTextStyle: .headline).scaledFont(for: scaledFont)
        }
        return font
    }
}
