//
//  SignUpCardViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class SignUpCardViewController: UIViewController {

    @IBOutlet weak var txtCardNumber: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnContinue.layer.cornerRadius = 8
        btnContinue.backgroundColor = UIColor.QR.mediumBlue
        
        title = "Tarjeta"
        hideBackText()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let signUpBusiness = segue.destination as? SignUpBusinessViewController {
            user?.clabe = txtCardNumber.text?.digits ?? ""
            signUpBusiness.user = user
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtCardNumber.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        
    }
    
}
