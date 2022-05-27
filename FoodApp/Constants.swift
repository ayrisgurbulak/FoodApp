//
//  Constants.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 20.05.2022.
//

import Foundation


struct C {
    
        static let appName = "Foods"
        static let detailSegue = "foodsToDetail"
        static let foodsIdentifier = "foodCell"
        static let cartIdentifier = "cartCell"
        
        struct Urls {
            static let getFoodsUrl = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
            static let postFoodToCartUrl = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php"
            static let getFoodInCartUrl = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
            static let deleteFoodFromCartUrl = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php"
            static let foodImageUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
        }
        
    
}
