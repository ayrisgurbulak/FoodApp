//
//  FoodDetailPresenter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation


class FoodDetailPresenter: ViewToPresenterFoodDetailProtocol, ViewToPresenterCartProtocol {
    
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func getAllFoodsInCart(userName: String) {
        cartInteractor?.getFoodsInCart(userName: userName)
    }
    
    func deleteFromCart(sepet_yemek_id: Int, userName: String) {
        cartInteractor?.deleteFoodFromCart(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    
    var foodInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func postToCart(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String) {
        foodInteractor?.postFoodToCart(foodName: foodName, foodImageName: foodImageName, foodPrice: foodPrice, foodOrderQuantity: foodOrderQuantity, userName: userName)
    }
    
}

extension FoodDetailPresenter: InteractorToPresenterCartProtocol {
    func sendDataToPresenter(foodListInCart: Array<FoodsInCart>) {
        cartView?.sendDataToView(foodListInCart: foodListInCart)
    }
   
}
