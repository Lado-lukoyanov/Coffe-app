//
//  AuthEndpoint.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

enum AuthEndpoint {
    case login(_ login: String, _ password: String)
    case rigsiration(_ login: String, _ password: String)
}

extension AuthEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .rigsiration:
            return "/auth/register"
        }
    }
    
    var method: HTTPMethod { .postMethod }
    
    var task: HTTPTask {
        switch self {
        case .login(let login, let password):
            return .requestParametrs(nil, bodyParametrs: ["login": login, "password": password])
        case .rigsiration(let login, let password):
            return .requestParametrs(nil, bodyParametrs: ["login": login, "password": password])

        }
    }
    
    var headers: HTTPHeaders? { nil }
}
