//
//  SignUpBusinessViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import RxSwift

class SignUpBusinessViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    let userRepository = UserRepository()
    let disposeBag = DisposeBag.init()
    
    var user: User?
    
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
    
        user?.businessName = txtName.text ?? ""
        user?.password = txtPassword.text ?? ""
        
        showAsyncActivityIndicator { (activity) in
            self.userRepository.signUp(self.user!).bind(onNext: { (resultNewUser) in
                
                if case .error(let error) = resultNewUser {
                    self.showAlert("Error", message: error.localizedDescription)
                }
                
                if case .success(_) = resultNewUser {
                    let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UINavigationController
                    self.present(homeViewController, animated: true, completion: nil)
                }
                
                activity.removeFromSuperview()
                
            }).disposed(by: self.disposeBag)
        }
        
    }
    
}
