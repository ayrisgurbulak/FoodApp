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
    
    var foodDetail: Foods?
    var foodPresenterObject: ViewToPresenterFoodDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodNameLabel.text = foodDetail?.yemek_adi
        let url = URL(string: C.Urls.foodImageUrl + foodDetail!.yemek_resim_adi)
        foodImageView.kf.setImage(with: url)
        foodPriceLabel.text = foodDetail!.yemek_fiyat + " ₺"
        addCartButton.layer.cornerRadius = 10
        quantityStepper.minimumValue = 1
        
        FoodDetailRouter.createModule(ref: self)
        
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        foodQuantity.text = Int(sender.value).description
        foodPriceLabel.text = String(Int(foodDetail!.yemek_fiyat)! * Int(sender.value)) + " ₺"
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        foodPresenterObject?.postToCart(foodName: foodDetail!.yemek_adi, foodImageName: foodDetail!.yemek_resim_adi, foodPrice: Int(foodDetail!.yemek_fiyat)!, foodOrderQuantity: Int(foodQuantity.text!)!, userName: "Ayris")
    }
    
}
