//
//  FoodDetailPresenter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation


class FoodDetailPresenter: ViewToPresenterFoodDetailProtocol {
    
    var foodInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func postToCart(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String) {
        foodInteractor?.postFoodToCart(foodName: foodName, foodImageName: foodImageName, foodPrice: foodPrice, foodOrderQuantity: foodOrderQuantity, userName: userName)
    }
    
}
