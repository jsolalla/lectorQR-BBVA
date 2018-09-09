//
//  PaymentAmountTableCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class PaymentAmountTableCell: UITableViewCell {

    @IBOutlet weak var txtAmount: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtAmount.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
