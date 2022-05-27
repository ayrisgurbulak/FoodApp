//
//  CartViewController.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import UIKit

class MyCartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    var cartPresenterObject: ViewToPresenterCartProtocol?
    var foodList =  [FoodsInCart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.rowHeight = 120
        cartTableView.separatorStyle = .none
        
        MyCartRouter.createModule(ref: self)
        cartPresenterObject?.getAllFoodsInCart(userName: "Ayris")
    }

}

extension MyCartViewController: PresenterToViewCartProtocol {
    func sendDataToView(foodListInCart: Array<FoodsInCart>) {
        self.foodList = foodListInCart
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
        }
    }

}

extension MyCartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: C.cartIdentifier, for: indexPath) as! MyCartTableViewCell
        
        cell.cartStepper.minimumValue = 1
        
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = foodList[indexPath.row].yemek_fiyat 
        cell.foodQuantity.text = foodList[indexPath.row].yemek_siparis_adet
        
        let url = URL(string: C.Urls.foodImageUrl + foodList[indexPath.row].yemek_resim_adi!)
        cell.foodImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print()
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action,view,void) in
            self.cartPresenterObject?.deleteFromCart(sepet_yemek_id: Int(self.foodList[indexPath.row].sepet_yemek_id!)!, userName: "Ayris")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
