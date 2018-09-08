//
//  AccountViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AccountViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountDetailTableCell") as! AccountDetailTableCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableCell") as! TransactionTableCell
        cell.isLast = indexPath.row == 9
        return cell
    }
    
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transactionViewController = storyboard!.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        navigationController?.pushViewController(transactionViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let header = UIView()
            let label = UILabel()
            label.frame = CGRect(x: 16, y: 12, width: view.frame.width - 32, height: 16)
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.text = "ULTIMOS MOVIMIENTOS"
            label.textColor = UIColor.QR.grayDark
            header.backgroundColor = UIColor.QR.gray
            header.addSubview(label)
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 38
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 200 : 64
    }
    
}
