//
//  Product.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/9/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

class Product {
    
    var productId = ""
    var name = ""
    var price = 0.0
    var imageURL = ""
    var upc = ""
    var idUser = ""
    var selected = false
    
    init(_ dict: [String:Any]) {
        productId = dict["id"] as? String ?? ""
        name = dict["nombre"] as? String ?? ""
        price = dict["precio"] as? Double ?? 0.0
        imageURL = dict["urlImagen"] as? String ?? ""
        upc = dict["upc"] as? String ?? ""
        idUser = dict["idUser"] as? String ?? ""
    }
    
}
