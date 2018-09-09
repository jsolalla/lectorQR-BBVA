//
//  BaseRepository.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import Moya

class BaseRepository {
    
    internal let provider: MoyaProvider<QREndpoint>!
    
    init() {
        provider = QRService.current.service
    }
    
    func getError(for message: String) -> Error {
        return NSError(domain: "qr.error", code: 888, userInfo: [NSLocalizedDescriptionKey: message]) as Error
    }
    
}
