//
//  FoodsPresenter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 20.05.2022.
//

import Foundation


class FoodsPresenter: ViewToPresenterFoodsController {
    
    var foodsInteractor: PresenterToInteractorFoodsController?
    
    var foodsView: PresenterToViewFoodsController?
    
    func getAllFoods() {
        foodsInteractor?.getFoods()
    }
    
    
}

extension FoodsPresenter: InteractorToPresenterFoodsController {
    
    func sendDataToPresenter(foodList: Array<Foods>) {
        foodsView?.sendDataToView(foodList: foodList)
    }
    
    
}
