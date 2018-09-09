//
//  User.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

class User {

    var id = ""
    var businessName = ""
    var password = ""
    var mobileNumber = ""
    var clabe = ""
    var state: State = .initialized
    
    init() { }
    
    init(_ dict: [String:Any]) {
        
        guard let id = dict["id"] as? String, let social = dict["razonSocial"] as? String, let phone = dict["telefono"] as? String else {
            state = .none
            return
        }
        
        self.id = id
        self.businessName = social
        self.mobileNumber = phone
        
        if let account = (dict["cuentas"] as? [[String:Any]])?.first {
            self.clabe = account["clabe"] as? String ?? ""
        }
        
        self.state = .initialized
    }
 
}
