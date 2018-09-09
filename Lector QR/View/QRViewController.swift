//
//  QRViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class QRViewController: UITableViewController {

    var products: [Product] = []
    var amount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(closeQRPayment))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(shareTicket))
        
        setUpNavigationBar()
    }
    
    @objc func closeQRPayment() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func shareTicket() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 + products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRAccountTableViewCell", for: indexPath) as! QRAccountTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRTransactionNoTableViewCell", for: indexPath) as! QRTransactionNoTableViewCell
            return cell
        }
        
        if products.count > 0 {
            if (indexPath.row - 2) < products.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "QRProductTableViewCell", for: indexPath) as! QRProductTableViewCell
                let product = products[indexPath.row - 2]
                cell.setProduct(product)
                return cell
            }
        }
        
        if indexPath.row == 2 || indexPath.row == products.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRTotalsTableViewCell", for: indexPath) as! QRTotalsTableViewCell
            cell.setTotals(with: amount, productsCount: products.count)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QRTableViewCell", for: indexPath) as! QRTableViewCell
            cell.amount = amount
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 80
        } else if indexPath.row == 1 {
            return 70
        }
        
        if products.count > 0 {
            if (indexPath.row - 2) < products.count {
               return 35
            }
        }
        
        if indexPath.row == 2 || indexPath.row == products.count + 2 {
            return 120
        } else {
            return 460
        }
    }
    
}
