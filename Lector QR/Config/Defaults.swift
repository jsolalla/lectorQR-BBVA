//
//  Defaults.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let emailKey = "email"
    static let userSessionKey = "com.qr.usersession"
    
    static func saveUser(_ email: String) {
        UserDefaults.standard.set([emailKey: email], forKey: userSessionKey)
    }
    
    static func getUser() -> String? {
        
        guard let userData = UserDefaults.standard.value(forKey: userSessionKey) as? [String: String], let email = userData[emailKey] else {
            return nil
        }
        
        return email
    }
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
    
}
