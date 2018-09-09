//
//  ProductTableViewCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgSelected: UIImageView!
    @IBOutlet weak var imgProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setProduct(_ product: Product, isInventoryView: Bool) {
        lblProductName.text = product.name
        lblPrice.text = "$\(product.price)"
        imgProduct.downloaded(from: product.imageURL)
        imgSelected.image = UIImage(named: product.selected ? "seleccion" : "seleccionOff")
        imgSelected.isHidden = isInventoryView
    }

}
