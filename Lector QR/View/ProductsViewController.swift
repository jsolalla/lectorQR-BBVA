//
//  ProductsViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnGenerateCode: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    let userRepository = UserRepository()
    var products: [Product] = []
    var isInventoryView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnGenerateCode.layer.cornerRadius = 8
        btnGenerateCode.isHidden = isInventoryView
        
        lblTitle.text = isInventoryView ? "Inventario" : "QR con productos"
        tableView.dataSource = self
        tableView.delegate = self
        
        _ = userRepository.getProducts().bind(onNext: { (resultProducts) in
            
            if case .error(let error) = resultProducts {
                self.showAlert("Error", message: error.localizedDescription)
            }
            
            if case .success(let productsResponse) = resultProducts {
                self.products = productsResponse
                self.tableView.reloadData()
            }
            
        })
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func generateCode(_ sender: UIButton) {
        
        let navigation = storyboard!.instantiateViewController(withIdentifier: "QRNavigation") as! UINavigationController
        
        if let qrPayment = navigation.childViewControllers.first as? QRViewController {
            let total = products.filter { $0.selected }.map { $0.price }.reduce(0, +)
            qrPayment.amount = total
            qrPayment.products = products.filter { $0.selected }
            qrPayment.navigation = navigationController
        }
        
        self.present(navigation, animated: true, completion: nil)
    }

    func setCodeQRTitle() {
        let total = products.filter { $0.selected }.map { $0.price }.reduce(0, +)
        btnGenerateCode.setTitle("GENERAR CÓDIGO POR $\(total)", for: .normal)
    }
    
}

extension ProductsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        cell.setProduct(products[indexPath.row], isInventoryView: isInventoryView)
        return cell
    }
    
}

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        products[indexPath.row].selected = !products[indexPath.row].selected
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        setCodeQRTitle()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
}
