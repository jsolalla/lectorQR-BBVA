//
//  AccountDetailTableCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class AccountDetailTableCell: UITableViewCell {

    @IBOutlet weak var viewAccountDetail: UIView!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblCurrentBalance: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewAccountDetail.dropShadow()
        
        let mobileNumber = Defaults.getBusiness?.number ?? ""
        lblAccount.text = "Celular \(mobileNumber)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
