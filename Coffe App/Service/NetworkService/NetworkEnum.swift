//
//  NetworkEnum.swift
//  tets app
//
//  Created by Владимир  Лукоянов on 22.01.2024.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Configuration.BaseURl.baseURL) else {
            fatalError("Missing base URL")
            
        }
        return url
        
    }
    
}



