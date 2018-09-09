//
//  QRTotalsTableViewCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class QRTotalsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblIVA: UILabel!
    @IBOutlet weak var lblProductsBuyed: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTotals(with amount: Double, productsCount: Int) {
        let IVA = amount * 0.16
        lblSubtotal.text = "$\((amount - IVA).toString())"
        lblIVA.text = "$\(IVA.toString())"
        lblProductsBuyed.text = "\(productsCount)"
        lblTotal.text = "$\(amount.toString())"
        lblProductsBuyed.isHidden = productsCount == 0
    }

}
