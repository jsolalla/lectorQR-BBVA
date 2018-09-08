//
//  SignUpViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnLogin.layer.cornerRadius = 8
        btnLogin.backgroundColor = UIColor.QR.mediumBlue
        
        setUpNavigationBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtMobileNumber.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func openPrivacyPolicy(_ sender: UIButton) {
    
    }
    
}
