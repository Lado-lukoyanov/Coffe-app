//
//  Enicoder.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
public enum EncodingError: String, Error {
    case missingURL = "URL is missing"
    case missingParameters = "Parameters is missing"
    case encodingFailure = "Encoding failed"
}

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: NetworkParametrs) throws
}
public final class URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: NetworkParametrs) throws {
        guard let url = urlRequest.url else { throw EncodingError.missingURL }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty else {
            throw EncodingError.encodingFailure
        }

        urlComponents.queryItems = [URLQueryItem]()
        for (name, value) in parameters {
            let item = URLQueryItem(name: name, value: "'\(value)'".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents.queryItems?.append(item)
        }
        urlRequest.url = urlComponents.url

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}

public final class JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: NetworkParametrs) throws {
        do {
            let json = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = json
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw EncodingError.encodingFailure
        }
    }
}
