//
//  Comments.swift
//  GBShop
//
//  Created by Егор Кожемин on 02.04.2022.
//

import Foundation

struct Comments: Codable {
    let count: Int
    let offset: Int
    let items: [Comment]
}
