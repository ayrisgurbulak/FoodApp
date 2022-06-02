//
//  CartTableViewCell.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 25.05.2022.
//

import UIKit

class MyCartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperAction(_ sender: UIStepper) {
    }
}
