//
//  CartInteractor.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import Foundation

class MyCartInteractor: PresenterToInteractorCartProtocol {
    
    var cartPresenter: InteractorToPresenterCartProtocol?
    
    func getFoodsInCart(userName: String) {
        var request = URLRequest(url: URL(string: C.Urls.getFoodInCartUrl)!)
        request.httpMethod = "POST"
        
        let postString = "kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(FoodsInCartResponse.self, from: data!)
                
                if let foodListInCart = cevap.sepet_yemekler {
                    self.cartPresenter?.sendDataToPresenter(foodListInCart: foodListInCart )
                }
                else {
                    self.cartPresenter?.sendDataToPresenter(foodListInCart: [])
                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    func deleteFoodFromCart(sepet_yemek_id: Int, userName: String) {
        var request = URLRequest(url: URL(string: C.Urls.deleteFoodFromCartUrl)!)
        request.httpMethod = "POST"
        
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(DeleteFromCartResponse.self, from: data!)
                
                print(cevap)
                self.getFoodsInCart(userName: userName)
                
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}
