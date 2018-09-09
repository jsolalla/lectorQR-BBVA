//
//  API.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/7/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

enum State {
    case initialized
    case none
}

enum APIResult<T> {
    case success(T)
    case error(Error)
}

public enum APIEndPointConfig: String, Equatable {
    
    case production = "PRODUCTION"
    case development = "DEV"
    
    public var url: String {
        
        if self == .production {
            return "http://138.68.16.213:8080"
        }
        
        return "http://138.68.16.213:8080"
    }
    
    public static let defaultConfig = APIEndPointConfig.development
    
}
