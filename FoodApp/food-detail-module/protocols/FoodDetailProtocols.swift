//
//  FoodDetailProtocols.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol {
    var foodInteractor: PresenterToInteractorFoodDetailProtocol? { get set }
    
    func postToCart(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String)

}


protocol PresenterToInteractorFoodDetailProtocol {
    func postFoodToCart(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String)
    
}

protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailViewController)
}

