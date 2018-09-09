//
//  UserViewModel.swift
//  Lector QR
//
//  Created by Jesus Santa Olalla on 9/8/18.
//  Copyright © 2018 minttcode. All rights reserved.
//

import Foundation
import RxSwift

class UserViewModel {
    
    let repository = UserRepository()
    
    func signUp(_ user: User) -> Observable<APIResult<User>> {
        return repository.signUp(user)
    }
    
}
