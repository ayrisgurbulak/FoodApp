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
    
    var foodList = [Foods]()
    
    var foodsPresenterObject: ViewToPresenterFoodsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        FoodsCollectionView.delegate = self
        FoodsCollectionView.dataSource = self
        
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
    
    /*override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }*/
    
    /*override func viewWillAppear(_ animated: Bool) {
        foodsPresenterObject?.getAllFoods()
    }*/
    
}


extension FoodsPageViewController: PresenterToViewFoodsController {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCollectionViewCell
        
        cell.layer.cornerRadius = 10
        
        let url = URL(string: C.Urls.foodImageUrl + foodList[indexPath.row].yemek_resim_adi)
        cell.foodImage.kf.setImage(with: url)
        cell.foodImage.frame.size.height = cell.foodImage.frame.width
        cell.foodName.text = foodList[indexPath.row].yemek_adi
        cell.foodPrice.text = foodList[indexPath.row].yemek_fiyat
        
        return cell

    }
    
    
}

