//
//  API.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/7/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

public enum APIEndPointConfig: String, Equatable {
    
    case production = "PRODUCTION"
    case development = "DEV"
    
    public var url: String {
        
        if self == .production {
            return "https://super.walmart.com.mx"
        }
        
        return "https://super-qa.walmart.com.mx"
    }
    
    public static let defaultConfig = APIEndPointConfig.development
    
}
