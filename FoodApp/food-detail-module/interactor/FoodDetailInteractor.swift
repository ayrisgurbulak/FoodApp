//
//  FoodDetailInteractor.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 21.05.2022.
//

import Foundation

class FoodDetailInteractor: PresenterToInteractorFoodDetailProtocol {
    
    func postFoodToCart(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String) {
        
        var request = URLRequest(url: URL(string: C.Urls.postFoodToCartUrl)!)
        request.httpMethod = "POST"
        
        let postString = "yemek_adi=\(foodName)&yemek_resim_adi=\(foodImageName)&yemek_fiyat=\(foodPrice)&yemek_siparis_adet=\(foodOrderQuantity)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(AddFoodToCartResponse.self, from: data!)
                print(cevap.message ?? "No message")
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
}
