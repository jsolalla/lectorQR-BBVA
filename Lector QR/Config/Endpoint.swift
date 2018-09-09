//
//  Endpoint.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation

class QREndpointConfig {
    
    private init() {}
    public static var current = QREndpointConfig()
    
    private var contentPath: String {
        return "api/rest/model"
    }
    
    public lazy var host: String = APIEndPointConfig.defaultConfig.url
    public lazy var baseURL: URL = URL(string: "\(self.host)/\(self.contentPath)")!
    
}
