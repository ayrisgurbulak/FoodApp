//
//  CartRouter.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import Foundation

class MyCartRouter: PresenterToRouterProtocol {
    
    static func createModule(ref: MyCartViewController) {
        let presenter = MyCartPresenter()
        
        ref.cartPresenterObject = presenter
        
        ref.cartPresenterObject?.cartInteractor = MyCartInteractor()
        ref.cartPresenterObject?.cartView = ref
        
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
    }
    
    
}
