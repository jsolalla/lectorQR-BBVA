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
    case signUp(user: User)
    case products(userId: String)
    case conciliate(numericKey: String, amount: Double, email: String, clabe: String, idDevice: String)
    case transactions(device: String)
}

extension QREndpoint: TargetType {
    
    var baseURL: URL {
        return QREndpointConfig.current.baseURL
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/user"
        case .conciliate:
            return "/conciliacion"
        case .transactions(let device):
            return "/transaccion/device/\(device)"
        case .products(let userId):
            return "/producto/user/\(userId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp, .conciliate:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .signUp(let user):
            return .requestParameters(parameters:
                [QRParams.businessName: user.businessName,
                 QRParams.name: user.businessName,
                 QRParams.phone: user.mobileNumber,
                 QRParams.password: user.password,
                 QRParams.accounts: [[QRParams.clabe: user.clabe]]
                ], encoding: POST_ENCODING)
        case .conciliate(let numericKey, let amount, let email, let clabe, let idDevice):
            return .requestParameters(parameters:
                [QRParams.alfanumerica: numericKey,
                 QRParams.amount: amount,
                 QRParams.account: [QRParams.clabe: clabe],
                 QRParams.email: email,
                 QRParams.idDevice: idDevice
                ], encoding: POST_ENCODING)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
