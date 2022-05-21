//
//  FoodsProtocols.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 20.05.2022.
//

import Foundation

//
protocol ViewToPresenterFoodsController {
    var foodsInteractor: PresenterToInteractorFoodsController? { get set }
    var foodsView: PresenterToViewFoodsController? { get set }
    
    func getAllFoods()
}

protocol PresenterToInteractorFoodsController {
    var foodsPresenter: InteractorToPresenterFoodsController? { get set }
    
    func getFoods()
}


//
protocol InteractorToPresenterFoodsController {
    func sendDataToPresenter(foodList: Array<Foods>)
}


protocol PresenterToViewFoodsController {
    func sendDataToView(foodList: Array<Foods>)
}


//
protocol PresenterToRouterFoodsController {
    static func createModule(ref: FoodsPageViewController)
}
