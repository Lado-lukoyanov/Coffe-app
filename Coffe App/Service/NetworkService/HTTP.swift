//
//  HTTP.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation


public typealias NetworkParametrs = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum HTTPMethod: String {
    case getMethod = "GET"
    case postMethod = "POST"
}


public enum HTTPTask {
    case request
    
    case requestParametrs(
        _ urlParametrs: NetworkParametrs?,
        bodyParametrs: NetworkParametrs?
    )
    
    case requestParametrsHeaderss(
        _ urlParametrs: NetworkParametrs?,
        bodyParametrs: NetworkParametrs?,
        headers: HTTPHeaders?
    )
}

