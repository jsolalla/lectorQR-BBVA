//
//  QRTableViewCell.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import QRCode

class QRTableViewCell: UITableViewCell {

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var btnFinalize: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btnFinalize.layer.cornerRadius = 8
        btnFinalize.backgroundColor = UIColor.QR.mediumBlue
        
        gradientView.dropShadow()
        
        let QRDictionary: [String:Any] = ["ot": "0001", "dOp": [["alias": "Probando QR (Alias)"],
                                        ["cl": "012180027192980453"], ["type": "CL"],
                                        ["refn": "Probando QR"],
                                        ["refa": "MAURICIO"], ["amount": "10.00"],
                                        ["bank": "00012"], ["country": "MX"], ["currency": "MXN"]]]
        
        if let qrData = try? JSONSerialization.data(withJSONObject: QRDictionary) {
            let qrCode = QRCode(qrData)
            qrImageView.image = UIImageView(qrCode: qrCode).image
        }
 
    }

    @IBAction func finalize(_ sender: UIButton) {
    
    }
    
}
