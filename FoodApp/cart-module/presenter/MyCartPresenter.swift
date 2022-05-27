//
//  CartPresenter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import Foundation

class MyCartPresenter: ViewToPresenterCartProtocol {
    
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    var cartView: PresenterToViewCartProtocol?
    
    func getAllFoodsInCart(userName: String) {
        cartInteractor?.getFoodsInCart(userName: userName)
    }
    
    func deleteFromCart(sepet_yemek_id: Int, userName: String) {
        cartInteractor?.deleteFoodFromCart(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    
}

extension MyCartPresenter: InteractorToPresenterCartProtocol {
    
    func sendDataToPresenter(foodListInCart: Array<FoodsInCart>) {
        cartView?.sendDataToView(foodListInCart: foodListInCart)
    }

}
