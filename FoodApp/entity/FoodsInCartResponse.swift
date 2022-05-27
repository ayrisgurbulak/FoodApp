//
//  FoodsInCartResponse.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import Foundation

class FoodsInCartResponse: Codable {
    var sepet_yemekler : [FoodsInCart]?
    var success: Int?
}
