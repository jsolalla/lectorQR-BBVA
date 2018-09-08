//
//  Extensions.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/7/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import UIKit

func delay(seconds: Double, completion: @escaping ()->()) {
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex: Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor
        addSublayer(border)
    }
    
}

extension UIViewController {
    
    public func showActivityIndicator(completion: @escaping () -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var asyncView = appDelegate.window!.rootViewController!.view!
        
        if let presentedController = appDelegate.window!.rootViewController!.presentedViewController {
            asyncView = presentedController.view
        }
        
        let indicatorView = UIView()
        indicatorView.frame = asyncView.frame
        indicatorView.center = asyncView.center
        indicatorView.backgroundColor = .clear
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = asyncView.center
        loadingView.backgroundColor = .black
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.activityIndicatorViewStyle = .whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        actInd.startAnimating()
        
        loadingView.addSubview(actInd)
        indicatorView.addSubview(loadingView)
        
        asyncView.addSubview(indicatorView)
        
        delay(seconds: 0.5) {
            completion()
            indicatorView.removeFromSuperview()
        }
        
    }
    
    public func showAsyncActivityIndicator(completion: @escaping (_ activityView: UIView) -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let view = appDelegate.window!.rootViewController!.view!
        
        let indicatorView = UIView()
        indicatorView.frame = view.frame
        indicatorView.center = view.center
        indicatorView.backgroundColor = .clear
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = view.center
        loadingView.backgroundColor = .black
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.activityIndicatorViewStyle = .whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(actInd)
        indicatorView.addSubview(loadingView)
        actInd.startAnimating()
        
        view.addSubview(indicatorView)
        
        completion(indicatorView)
        
    }
    
    public func showAsyncActivityIndicator(in view: UIView, completion: @escaping (_ activityView: UIView) -> Void) {
        
        let indicatorView = UIView()
        indicatorView.frame = view.frame
        indicatorView.center = view.center
        indicatorView.backgroundColor = .clear
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = view.center
        loadingView.backgroundColor = .black
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.activityIndicatorViewStyle = .whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(actInd)
        indicatorView.addSubview(loadingView)
        actInd.startAnimating()
        
        view.addSubview(indicatorView)
        completion(indicatorView)
    }
    
    public func shakeView(_ viewToShake: UIView) {
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        var from_point: CGPoint = CGPoint(x: viewToShake.center.x - 5, y: viewToShake.center.y)
        var from_value: NSValue = NSValue(cgPoint: from_point)
        
        var to_point: CGPoint = CGPoint(x: viewToShake.center.x + 5, y: viewToShake.center.y)
        var to_value: NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        viewToShake.layer.add(shake, forKey: "position")
        
        from_point = CGPoint(x: viewToShake.center.x - 5, y: viewToShake.center.y)
        from_value = NSValue(cgPoint: from_point)
        
        to_point = CGPoint(x: viewToShake.center.x + 5, y: viewToShake.center.y)
        to_value = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        viewToShake.layer.add(shake, forKey: "position")
    }
    
    public func tapView(_ viewTapped: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 0.95, 1.0]
        animation.keyTimes = [0, 0.3, 0.8]
        animation.duration = 0.2
        animation.repeatCount = 1
        viewTapped.layer.add(animation, forKey: nil)
    }
    
    public func setUpNavigationBar(title: String = "") {
        
        let backImage = UIImage(named: "back")
        
        hideBackText()
            
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationController?.navigationBar.backItem?.title = " "
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.QR.mediumBlue]
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.QR.mediumBlue
        navigationController?.navigationBar.topItem?.title = title
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.shouldRemoveShadow(true)
        
        navigationController?.view.backgroundColor = UIColor.white
    }
    
    public func hideBackText() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    public func showAlert(_ tittle : String, message : String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func showAlertWithCompletion(_ tittle : String, message : String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func showAlertWithCompletionOptions(_ tittle : String, message : String, completion: @escaping (_ yes: Bool) -> Void) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sí", style: .default, handler: { (UIAlertAction) -> Void in
            completion(true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (UIAlertAction) -> Void in
            completion(false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func showAlertWithCompletionOptionsAndActions(_ tittle: String, yesAction: String, noAction: String, message: String, completion: @escaping (_ yes: Bool) -> Void) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: noAction, style: .cancel, handler: { (UIAlertAction) -> Void in
            completion(false)
        }))
        alert.addAction(UIAlertAction(title: yesAction, style: .destructive, handler: { (UIAlertAction) -> Void in
            completion(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func addParallaxToView(vw: UIView) {
        
        let amount = 10
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
    
}

extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
    
}

extension UIView {
    
    func dropShadow() {
        layer.cornerRadius = 6
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 4.0
        layer.rasterizationScale =  1
    }

    @discardableResult func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillColor = UIColor.white.cgColor
        layer.mask = mask
        return mask
    }
    
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        _ = _round(corners: corners, radius: radius)
    }
    
}
