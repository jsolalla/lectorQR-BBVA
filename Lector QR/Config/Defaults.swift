//
//  Defaults.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let (numberKey, businessKey, clabeKey, idKey) = ("number", "business", "id", "clabe")
    static let userSessionKey = "com.qr.usersession"
    
    struct BusinessLogged {
        
        var number: String?
        var business: String?
        var id: String?
        var clabe: String?
        
        init(_ json: [String: String]) {
            self.number = json[numberKey]
            self.business = json[businessKey]
            self.id = json[idKey]
            self.clabe = json[clabeKey]
        }
        
    }
    
    static func saveUser(_ user: User) {
        UserDefaults.standard.set([numberKey: user.mobileNumber, businessKey: user.businessName, clabeKey: user.clabe, idKey: user.id], forKey: userSessionKey)
    }
    
    static var getBusiness = { _ -> BusinessLogged? in
        
        guard let session = (UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) else {
            return nil
        }
        
        return BusinessLogged(session)
    }(())
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
    
}
