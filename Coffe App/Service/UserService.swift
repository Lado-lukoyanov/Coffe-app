//
//  UserService.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

protocol UserServiceProtocol {
    func userRigistartion()
    func isUserRigistration() -> Bool
}

final class UserService: UserServiceProtocol {
    static let shared = UserService()
    
    private init(){}
    
    var token: UserSucess?
    
    func userRigistartion() {
        UserDefaults.standard.set(true, forKey: Configuration.UserKeys.rigistration)
    }
    
    func isUserRigistration() -> Bool {
        UserDefaults.standard.bool(forKey: Configuration.UserKeys.rigistration)
    }
}
