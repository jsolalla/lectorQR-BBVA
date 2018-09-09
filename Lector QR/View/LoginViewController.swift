//
//  LoginViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let userViewModel = UserViewModel()
    let disposeBag = DisposeBag.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        scrollView.addGestureRecognizer(tapGesture)
        
        setUpNavigationBar()
        
        if let business = Defaults.getBusiness?.business {
            lblUser.text = business
        }
        
        btnLogin.layer.cornerRadius = 8
        btnLogin.backgroundColor = UIColor.QR.mediumBlue
        
        txtPassword.rx.text.orEmpty
            .map { $0.count >= 2 }
            .share(replay: 1)
            .bind(to: btnLogin.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtPassword.layer.addBorder(edge: .bottom, color: UIColor.QR.gray, thickness: 1.0)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
    
    }
    
    @IBAction func login(_ sender: UIButton) {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UINavigationController
        self.present(homeViewController, animated: true, completion: nil)
    }
    
}
