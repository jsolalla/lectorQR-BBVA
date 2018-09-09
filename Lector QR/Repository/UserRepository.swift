//
//  UserRepository.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Mapper

class UserRepository: BaseRepository {
    
    func signUp(_ user: User) -> Observable<APIResult<User>> {
        
        return Observable.create { [weak self] observer in
            
            if let strongSelf = self {
                
                _ = strongSelf.provider.rx.request(.signUp(user: user))
                    .filterSuccessfulStatusCodes()
                    .mapJSON()
                    .subscribe { event in
                        switch event {
                        case .success(let userDict):
                        
                            if let user = userDict as? [String:Any] {
                                let userOBJ = User(user)
                                Defaults.saveUser(userOBJ)
                                observer.onNext(APIResult.success(userOBJ))
                                observer.onCompleted()
                            } else {
                                observer.onNext(APIResult.error(strongSelf.getError(for: "Could not parse")))
                                observer.onCompleted()
                            }
                            
                        case .error(let error):
                            observer.onNext(APIResult.error(error))
                            observer.onCompleted()
                        }
                }
            }
            
            return Disposables.create()
        }
    }
    
    func getProducts() -> Observable<APIResult<[Product]>> {
        
        return Observable.create { [weak self] observer in
            
            if let strongSelf = self {
                
                _ = strongSelf.provider.rx.request(.products(userId: "23234"))
                    .filterSuccessfulStatusCodes()
                    .mapJSON()
                    .subscribe { event in
                        switch event {
                        case .success(let dict):
                            
                            if let productsDict = dict as? [[String:Any]] {
                                let products = productsDict.map { Product($0) }
                                observer.onNext(APIResult.success(products))
                                observer.onCompleted()
                            } else {
                                observer.onNext(APIResult.error(strongSelf.getError(for: "Could not parse")))
                                observer.onCompleted()
                            }
                            
                        case .error(let error):
                            observer.onNext(APIResult.error(error))
                            observer.onCompleted()
                        }
                }
            }
            
            return Disposables.create()
        }
    }
    
}
