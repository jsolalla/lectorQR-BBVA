//
//  QRTableViewCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import QRCode

protocol QRTableViewCellDelegate: class {
    func conciliate(transaction: Transaction)
}

class QRTableViewCell: UITableViewCell {

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var btnFinalize: UIButton!
    
    weak var delegate: QRTableViewCellDelegate?
    var amount = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btnFinalize.layer.cornerRadius = 8
        btnFinalize.backgroundColor = UIColor.QR.mediumBlue
        
        gradientView.dropShadow()
        
        let account = Defaults.getBusiness?.clabe ?? ""
        let businessName = Defaults.getBusiness?.business ?? ""
        
        let QRDictionary: [String:Any] = ["ot": "0001", "dOp": [["alias": "Pago \(businessName)"],
                                        ["cl": account], ["type": "CL"],
                                        ["refn": "Pago \(businessName)"],
                                        ["refa": "Pago \(businessName)"], ["amount": "\(amount.toString)"],
                                        ["bank": "00012"], ["country": "MX"], ["currency": "MXN"]]]
        
        if let qrData = try? JSONSerialization.data(withJSONObject: QRDictionary) {
            let qrCode = QRCode(qrData)
            qrImageView.image = UIImageView(qrCode: qrCode).image
        }
 
    }

    @IBAction func finalize(_ sender: UIButton) {
        let account = Defaults.getBusiness?.clabe ?? ""
        let businessName = Defaults.getBusiness?.business ?? ""
        let transaction = Transaction()
        transaction.alfanumerica = "Pago \(businessName)"
        transaction.clabe = account
        transaction.amount = amount
        delegate?.conciliate(transaction: transaction)
    }
    
}
