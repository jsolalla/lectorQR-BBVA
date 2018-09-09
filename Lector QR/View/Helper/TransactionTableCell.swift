//
//  TransactionTableCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class TransactionTableCell: UITableViewCell {

    @IBOutlet weak var lblFromAccount: UILabel!
    @IBOutlet weak var lblFolio: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    var isLast = false {
        didSet {
            clipsToBounds = !isLast
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTransaction(_ transaction: Transaction) {
        lblFolio.text = transaction.id
        lblAmount.text = "$\(transaction.amount.toString())"
        lblFromAccount.text = "Cuenta MX * \(String(transaction.clabe.suffix(4)))"
    }
    
    func clean() {
        lblFolio.text = ""
        lblAmount.text = ""
        lblFromAccount.text = ""
    }

}
