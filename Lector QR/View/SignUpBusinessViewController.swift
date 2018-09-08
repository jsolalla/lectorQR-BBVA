//
//  SignUpBusinessViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class SignUpBusinessViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnSignUp.layer.cornerRadius = 8
        btnSignUp.backgroundColor = UIColor.QR.mediumBlue
        
        title = "Negocio"
        hideBackText()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtName.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
        txtPassword.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
    
    }
    
}
