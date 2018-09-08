//
//  TransactionViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var lblAccountFrom: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var btnShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnShare.layer.cornerRadius = 8
        btnShare.backgroundColor = UIColor.QR.blueBright
        
        _ = stackView.subviews.map { $0.addBottomBorder(UIColor.QR.gray.cgColor, borderWidth: 2.0)}
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func share(_ sender: UIButton) {
    
    }
    
}
