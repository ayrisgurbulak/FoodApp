//
//  FoodDetailRouter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation

class FoodDetailRouter: PresenterToRouterFoodDetailProtocol {
    
    static func createModule(ref: FoodDetailViewController) {
        
        ref.foodPresenterObject = FoodDetailPresenter()
        
        ref.foodPresenterObject?.foodInteractor =  FoodDetailInteractor()
    }
    
    
}
