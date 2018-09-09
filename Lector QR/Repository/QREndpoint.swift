//
//  QREndpoint.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import Moya

fileprivate let GET_ENCODING: ParameterEncoding = URLEncoding.queryString
fileprivate let POST_ENCODING: ParameterEncoding = JSONEncoding.prettyPrinted
fileprivate let POST_FORM: ParameterEncoding = URLEncoding.httpBody

enum QREndpoint {
    
}

extension QREndpoint: TargetType {
    
    var baseURL: URL {
        return QREndpointConfig.current.baseURL
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
