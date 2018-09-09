//
//  Transaction.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/9/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

class Transaction {
    
    var id = ""
    var alfanumerica = ""
    var amount = 314.0
    var date = 1536473648626
    var telefono = ""
    var clabe = ""
    var idDevice = ""
    var email = ""
    
    init() {}
    
    init(_ dict: [String:Any]) {
        
        id = dict["id"] as? String ?? ""
        alfanumerica = dict["alfanumerica"] as? String ?? ""
        amount = dict["amount"] as? Double ?? 0.0
        date = dict["date"] as? Int ?? 0
        telefono = dict["telefono"] as? String ?? ""
        
        if let account = dict["cuenta"] as? [String:Any] {
            clabe = account["clabe"] as? String ?? ""
        }
        
        idDevice = dict["idDevice"] as? String ?? ""
    }
    
}
