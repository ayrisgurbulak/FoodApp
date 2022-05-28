//
//  FoodDetailRouter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation

class FoodDetailRouter: PresenterToRouterFoodDetailProtocol {
    
    static func createModule(ref: FoodDetailViewController) {
        
        let presenter = FoodDetailPresenter()
        
        ref.foodPresenterObject = presenter
        ref.cartPresenterObject = MyCartPresenter()
        
        ref.foodPresenterObject?.foodInteractor = FoodDetailInteractor()
        
        let presenter2 = MyCartPresenter()
        ref.cartPresenterObject = presenter2
        
        ref.cartPresenterObject?.cartInteractor = MyCartInteractor()
        ref.cartPresenterObject?.cartView = ref
        
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter2
        
    }
    
    
}
