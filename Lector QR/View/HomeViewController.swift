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
        }).disposed(by: disposeBag)
        
        viewPay.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewPay)
        }).disposed(by: disposeBag)
        
        viewTransactions.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewTransactions)
        }).disposed(by: disposeBag)
        
        viewInventory.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewInventory)
        }).disposed(by: disposeBag)
        
        viewAccount.rx.tapGesture().when(.recognized) .subscribe(onNext: { _ in
            self.tapView(self.viewAccount)
        }).disposed(by: disposeBag)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewAccounts.dropShadow()
        viewPay.dropShadow()
        viewTransactions.dropShadow()
        viewInventory.dropShadow()
        viewAccount.dropShadow()
    }
    
}
