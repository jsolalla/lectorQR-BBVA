//
//  RecordsViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import RxSwift

class RecordsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let userRepository = UserRepository()
    let disposeBag = DisposeBag.init()
    
    var transactions: [Transaction] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = userRepository.getTransactions().bind(onNext: { (resultTransactions) in
            
            if case .error(let error) = resultTransactions {
                self.showAlert("Error", message: error.localizedDescription)
            }
            
            if case .success(let transactionsResponse) = resultTransactions {
                self.transactions = transactionsResponse
                self.tableView.reloadData()
            }
            
        })
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableCell") as! TransactionTableCell
        cell.isLast = indexPath.row == (transactions.count - 1)
        cell.setTransaction(transactions[indexPath.row])
        return cell
    }
    
}

extension RecordsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transactionViewController = storyboard!.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        navigationController?.pushViewController(transactionViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let label = UILabel()
        label.frame = CGRect(x: 16, y: 12, width: view.frame.width - 32, height: 16)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "TODOS LOS MOVIMIENTOS"
        label.textColor = UIColor.QR.grayDark
        header.backgroundColor = UIColor.QR.gray
        header.addSubview(label)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
