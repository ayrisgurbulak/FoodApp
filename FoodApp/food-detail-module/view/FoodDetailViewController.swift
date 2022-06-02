//
//  FoodDetailViewController.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 24.05.2022.
//

import UIKit
import Kingfisher

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var addCartButton: UIButton!
    @IBOutlet weak var foodQuantity: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    var username: String?
    var foodDetail: Foods?
    var foodsInCart =  [FoodsInCart]()
    var foodPresenterObject: ViewToPresenterFoodDetailProtocol?
    var cartPresenterObject: ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Food"
        
        foodNameLabel.text = foodDetail?.yemek_adi
        let url = URL(string: C.Urls.foodImageUrl + foodDetail!.yemek_resim_adi)
        foodImageView.kf.setImage(with: url)
        foodPriceLabel.text = foodDetail!.yemek_fiyat + " ₺"
        addCartButton.layer.cornerRadius = 10
        quantityStepper.minimumValue = 1
        
        FoodDetailRouter.createModule(ref: self)
        MyCartRouter.createModule(ref: (self.navigationController?.tabBarController?.viewControllers?[1].children.first) as! MyCartViewController)
        cartPresenterObject?.getAllFoodsInCart(userName: username ?? "Ayris")

    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        foodQuantity.text = Int(sender.value).description
        foodPriceLabel.text = String(Int(foodDetail!.yemek_fiyat)! * Int(sender.value)) + " ₺"
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        var check = false
        for i in foodsInCart {
            if foodDetail?.yemek_adi == i.yemek_adi {
                cartPresenterObject?.deleteFromCart(sepet_yemek_id: Int(i.sepet_yemek_id!)!, userName: username ?? "Ayris")
                foodPresenterObject?.postToCart(foodName: foodDetail!.yemek_adi, foodImageName: foodDetail!.yemek_resim_adi, foodPrice: Int(foodDetail!.yemek_fiyat)!, foodOrderQuantity: Int(foodQuantity.text!)! + Int(i.yemek_siparis_adet!)!, userName: username ?? "Ayris")
                check = true
            }
        }
        
        if check == false {
            foodPresenterObject?.postToCart(foodName: foodDetail!.yemek_adi, foodImageName: foodDetail!.yemek_resim_adi, foodPrice: Int(foodDetail!.yemek_fiyat)!, foodOrderQuantity: Int(foodQuantity.text!)!, userName: username ?? "Ayris")
        }
        
    }
    
}

extension FoodDetailViewController: PresenterToViewFoodDetailProtocol, PresenterToViewCartProtocol {
    func sendDataToView(foodListInCart: Array<FoodsInCart>) {
            self.foodsInCart = foodListInCart
    }
}
