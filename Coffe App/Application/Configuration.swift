//
//  Configuration.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

struct Configuration {
    private init() {}
    
    struct BaseURl {
        static let baseURL  = "http://147.78.66.203:3210/"
    }
    
    struct UserKeys {
        static let rigistration = "userRigistration"
    }
    
    struct YandexKey {
        static let key = "YOUR_API_KEY"
    }
}
