//
//  PaymentViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnGenerateCode: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        
        tableView.addGestureRecognizer(tapGesture)
        tableView.delegate = self
        tableView.dataSource = self
        
        btnGenerateCode.layer.cornerRadius = 8
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func generateCode(_ sender: UIButton) {
        let navigation = storyboard!.instantiateViewController(withIdentifier: "QRNavigation") as! UINavigationController
        self.present(navigation, animated: true, completion: nil)
    }
    
}

extension PaymentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentAmountTableCell") as! PaymentAmountTableCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentProductsTableCell") as! UITableViewCell
        return cell
    }
    
}

extension PaymentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = UIView()
            let label = UILabel()
            label.frame = CGRect(x: 16, y: 12, width: view.frame.width - 32, height: 16)
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.text = "RÁPIDO"
            label.textColor = UIColor.QR.grayDark
            header.backgroundColor = UIColor.QR.gray
            header.addSubview(label)
            return header
        } else {
            let header = UIView()
            let label = UILabel()
            label.frame = CGRect(x: 16, y: 12, width: view.frame.width - 32, height: 16)
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.text = "CON PRODUCTOS"
            label.textColor = UIColor.QR.grayDark
            header.backgroundColor = UIColor.QR.gray
            header.addSubview(label)
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  38
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 135 : 64
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
}
