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
            
                    
            do {
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(FoodsInCartResponse.self, from: data!)
                if let foodListInCart = result.sepet_yemekler {
                    self.cartPresenter?.sendDataToPresenter(foodListInCart: foodListInCart)
                }
            }
            catch let error as DecodingError
            {
                switch error {
                    case .typeMismatch(let key, let value):
                      print("error typeMismatch \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                      print("error valueNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                      print("error keyNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                      //The given data was not valid JSON
                      print("error dataCorrupted \(key), and ERROR: \(error.localizedDescription)")
                    default:
                      print("ERROR: \(error.localizedDescription)")
                    }
                self.cartPresenter?.sendDataToPresenter(foodListInCart: [])
                
            }
            catch {
                print(error.localizedDescription)
            }
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
                    
            do {
                let result = try JSONDecoder().decode(DeleteFromCartResponse.self, from: data!)
                print(result)
                self.getFoodsInCart(userName: userName)
                
             } catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}
