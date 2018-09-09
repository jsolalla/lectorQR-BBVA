//
//  QRService.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire

class QRServerTrustPoliceManager: ServerTrustPolicyManager {
    
    public init() {
        super.init(policies: [:])
    }
    
    override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return .disableEvaluation
    }
    
}

class QRService {
    
    static let current = QRService()
    
    public lazy var service: MoyaProvider<QREndpoint> = { [weak self] in
        
        let endpointClosure = { (target: QREndpoint) -> Endpoint<QREndpoint> in
            
            var endpoint: Endpoint<QREndpoint> = MoyaProvider.defaultEndpointMapping(for: target)
            
            guard let strongSelf = self else {
                return endpoint
            }
            
//            if let cookies = HTTPCookieStorage.shared.cookies(for: URL(string: APIEndPointConfig.current.groceries)!) {
//                let headers = HTTPCookie.requestHeaderFields(with: cookies)
//                endpoint = endpoint.adding(newHTTPHeaderFields: headers)
//            }
            
            return endpoint
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        
        let manager = Manager(configuration: configuration, serverTrustPolicyManager: QRServerTrustPoliceManager())
        let provider = MoyaProvider<QREndpoint>(endpointClosure: endpointClosure, manager: manager, plugins: [NetworkLoggerPlugin(verbose: true)])
        
        return provider
    }()
    
}
