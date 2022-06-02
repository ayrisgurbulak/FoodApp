//
//  CartViewController.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import UIKit

class MyCartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var cartPresenterObject: ViewToPresenterCartProtocol?
    var foodList =  [FoodsInCart]()
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Your Cart"
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.rowHeight = 120
        cartTableView.separatorStyle = .none
        
        MyCartRouter.createModule(ref: self)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cartPresenterObject?.getAllFoodsInCart(userName: username ?? "Ayris")
        
    }

}

extension MyCartViewController: PresenterToViewCartProtocol {
    func sendDataToView(foodListInCart: Array<FoodsInCart>) {
        self.foodList = foodListInCart
        
        DispatchQueue.main.async {
            self.cartTableView.reloadData()
            var total = 0
            for i in self.foodList {
                total += Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!
            }
            self.totalLabel.text = "\(String(describing: total))" + " ₺"
        }
    }

}

extension MyCartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: C.cartIdentifier, for: indexPath) as! MyCartTableViewCell
        
        cell.cartView.layer.shadowColor = UIColor.gray.cgColor
        cell.cartView.layer.shadowOpacity = 0.3
        cell.cartView.layer.shadowOffset = CGSize.zero
        cell.cartView.layer.shadowRadius = 6
        cell.cartView.layer.cornerRadius = 10
        
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = foodList[indexPath.row].yemek_fiyat! + " ₺"
        cell.foodQuantity.text = foodList[indexPath.row].yemek_siparis_adet
        
        let url = URL(string: C.Urls.foodImageUrl + foodList[indexPath.row].yemek_resim_adi!)
        cell.foodImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action,view,void) in
            self.cartPresenterObject?.deleteFromCart(sepet_yemek_id: Int(self.foodList[indexPath.row].sepet_yemek_id!)!, userName: self.username ?? "Ayris")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
