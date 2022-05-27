//
//  FoodsRouter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 20.05.2022.
//

import Foundation


class FoodsRouter: PresenterToRouterFoodsProtocol {
    
    static func createModule(ref: FoodsPageViewController) {
        
        let presenter = FoodsPresenter()
        
        ref.foodsPresenterObject = presenter
        
        ref.foodsPresenterObject?.foodsInteractor = FoodsInteractor()
        ref.foodsPresenterObject?.foodsView = ref
        
        ref.foodsPresenterObject?.foodsInteractor?.foodsPresenter = presenter
    }
    
}
