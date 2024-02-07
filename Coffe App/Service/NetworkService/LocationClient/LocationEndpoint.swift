//
//  LocationEndpoint.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation

enum LocationEndpoint {
    case locatioon
    case menu(id: String)
}

extension LocationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .locatioon:
            return "locations"
        case .menu(let id):
            return "location/\(id)/menu"
        }
    }
    
    var method: HTTPMethod {.getMethod}
    
    var task: HTTPTask {
        .requestParametrsHeaderss(nil, bodyParametrs: nil, headers: headers)
    }
    
    var headers: HTTPHeaders? {
        guard let token = UserService.shared.token else { return [:]}
        
        return ["Authorization": "Bearer \(token.token)"]
    }
}

