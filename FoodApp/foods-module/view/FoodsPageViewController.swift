//
//  ViewController.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 19.05.2022.
//

import UIKit
import Kingfisher

class FoodsPageViewController: UIViewController {

    @IBOutlet weak var FoodsCollectionView: UICollectionView!
    var username: String?
    
    var foodList = [Foods]()
    
    var foodsPresenterObject: ViewToPresenterFoodsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondTab = (self.tabBarController?.viewControllers![1].children.first)! as! MyCartViewController
        secondTab.username = username
        
        FoodsCollectionView.delegate = self
        FoodsCollectionView.dataSource = self
        
        self.navigationController?.navigationBar.topItem?.title = "Foods"
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        let layout = UICollectionViewFlowLayout()
        // Çevre boşluğu
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        // Yatay itemler arası boşluk
        layout.minimumInteritemSpacing = 10
        // Dikeyde item arası boşluk
        layout.minimumLineSpacing = 20
        
        let collectionWidth = self.FoodsCollectionView.frame.size.width
        // Hücre genişliği
        let cellWidth = (collectionWidth -  60) / 2
        //image height sıkıntılı
        layout.itemSize = CGSize(width: cellWidth , height: cellWidth + 20)
        
        self.FoodsCollectionView.collectionViewLayout = layout
        
        FoodsRouter.createModule(ref: self)
        foodsPresenterObject?.getAllFoods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == C.detailSegue {
            if let food = sender as? Foods {
                let VC = segue.destination as! FoodDetailViewController
                VC.foodDetail = food
                VC.username = username
            }
        }
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        foodsPresenterObject?.getAllFoods()
    }*/
    
}


extension FoodsPageViewController: PresenterToViewFoodsProtocol {
    
    func sendDataToView(foodList: Array<Foods>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.FoodsCollectionView.reloadData()
        }
    }
    
    
}

extension FoodsPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.foodsIdentifier, for: indexPath) as! FoodCollectionViewCell
        
        
        /*cell.foodView.layer.cornerRadius = 10
        cell.foodView.layer.shadowColor = UIColor.gray.cgColor
        cell.foodView.layer.shadowOpacity = 0.3
        cell.foodView.layer.shadowOffset = CGSize.zero
        cell.foodView.layer.masksToBounds = true
        cell.foodView.layer.shadowRadius = 6*/
        
        cell.foodView.layer.cornerRadius = 10
        cell.foodView.layer.masksToBounds = true

        cell.layer.cornerRadius = 10
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowRadius = 2
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.masksToBounds = false
        
        let url = URL(string: C.Urls.foodImageUrl + foodList[indexPath.row].yemek_resim_adi)
        cell.foodImage.kf.setImage(with: url)
        cell.foodImage.frame.size.height = cell.foodImage.frame.width
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = foodList[indexPath.row].yemek_fiyat + " ₺"
        
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: C.detailSegue, sender: food)
    }
    
    
}

