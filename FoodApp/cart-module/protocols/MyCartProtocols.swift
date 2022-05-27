//
//  CartProtocols.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import Foundation

protocol ViewToPresenterCartProtocol {
    var cartInteractor: PresenterToInteractorCartProtocol? { get set }
    var cartView: PresenterToViewCartProtocol? { get set }
    
    func getAllFoodsInCart(userName: String)
    func deleteFromCart(sepet_yemek_id: Int, userName: String)
}

protocol PresenterToInteractorCartProtocol {
    var cartPresenter: InteractorToPresenterCartProtocol? { get set }
    
    func getFoodsInCart(userName: String)
    func deleteFoodFromCart(sepet_yemek_id: Int, userName: String)
}

protocol InteractorToPresenterCartProtocol {
    func sendDataToPresenter(foodListInCart: Array<FoodsInCart>)
}

protocol PresenterToViewCartProtocol {
    func sendDataToView(foodListInCart: Array<FoodsInCart>)
}

protocol PresenterToRouterProtocol {
    static func createModule(ref: MyCartViewController)
}
