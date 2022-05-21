//
//  FoodsInteractor.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 20.05.2022.
//

import Foundation

class FoodsInteractor: PresenterToInteractorFoodsController {
    
    var foodsPresenter: InteractorToPresenterFoodsController?
    
    func getFoods() {
        
        let url = URL(string: C.Urls.allFoodsUrl)!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do {
                let response = try JSONDecoder().decode(FoodsResponse.self, from: data!)
                if let list = response.yemekler {
                    self.foodsPresenter?.sendDataToPresenter(foodList:list )
                }
             } catch{print(error.localizedDescription)}
        }.resume()
        
    }
    
}
