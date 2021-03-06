//
//  HomeViewController.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import UIKit
import RxGesture
import RxSwift

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag.init()
    
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var lblBusinessName: UILabel!
    @IBOutlet weak var viewAccounts: UIView!
    @IBOutlet weak var viewHeaderHome: GradientView!
    @IBOutlet weak var viewPay: UIView!
    @IBOutlet weak var viewTransactions: UIView!
    @IBOutlet weak var viewInventory: UIView!
    @IBOutlet weak var viewAccount: UIView!
    @IBOutlet weak var viewTopSelling: UIView!
    @IBOutlet weak var viewTopSellers: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addParallaxToView(vw: lblGreeting)
        addParallaxToView(vw: lblBusinessName)
        addParallaxToView(vw: viewAccounts)
        
        _ = scrollView.subviews.map { if $0.tag == 10 { addParallaxToView(vw: $0) } }
        
        viewAccounts.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewAccounts)
            delay(seconds: 0.2, completion: {
                let accountViewController = self.storyboard!.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
                self.navigationController?.pushViewController(accountViewController, animated: true)
            })
        }).disposed(by: disposeBag)
        
        viewPay.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewPay)
            delay(seconds: 0.2, completion: {
                let paymentViewController = self.storyboard!.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
                self.navigationController?.pushViewController(paymentViewController, animated: true)
            })
        }).disposed(by: disposeBag)
        
        viewTransactions.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewTransactions)
            delay(seconds: 0.2, completion: {
                let recordsViewController = self.storyboard!.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
                self.navigationController?.pushViewController(recordsViewController, animated: true)
            })
        }).disposed(by: disposeBag)
        
        viewInventory.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewInventory)
            delay(seconds: 0.2, completion: {
                let productsViewController = self.storyboard!.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
                productsViewController.isInventoryView = true
                self.navigationController?.pushViewController(productsViewController, animated: true)
            })
        }).disposed(by: disposeBag)
        
        viewTopSelling.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewTopSelling)
        }).disposed(by: disposeBag)
        
        viewTopSellers.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewTopSellers)
        }).disposed(by: disposeBag)
        
        viewAccount.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewAccount)
            delay(seconds: 0.2, completion: {
                let transactionViewController = self.storyboard!.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
                self.navigationController?.pushViewController(transactionViewController, animated: true)
            })
        }).disposed(by: disposeBag)
        
        setUpNavigationBar(color: .clear)
        
        if let business = Defaults.getBusiness?.business {
            lblBusinessName.text = business
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewAccounts.dropShadow()
        viewPay.dropShadow()
        viewTransactions.dropShadow()
        viewTopSellers.dropShadow()
        viewTopSelling.dropShadow()
        viewInventory.dropShadow()
        viewAccount.dropShadow()
    }
    
}
