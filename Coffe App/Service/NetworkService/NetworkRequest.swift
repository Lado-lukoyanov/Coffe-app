//
//  NetworkRequest.swift
//  tets app
//
//  Created by Владимир  Лукоянов on 11.01.2024.
//

import Foundation

public typealias NetworkDataRequest = (_ data: Data?, _ responce: URLResponse?, _ error: Error?) -> Void


final class NetworkRequest<E: Endpoint> {
    
    private var task: URLSessionTask?
    
    func request(_ endpoint: E, completion: @escaping NetworkDataRequest) {
        do {
            let request = try buildRequest(from: endpoint)
            task = URLSession.shared.dataTask(with: request) {data , response, error in
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            }
        } catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
        task?.resume()
    }
    
    
    private func buildRequest(from endpoint: E) throws -> URLRequest {
        
        var request = URLRequest(url: endpoint.baseURL.appendingPathComponent(endpoint.path))
        
        request.httpMethod = endpoint.method.rawValue
        
        switch endpoint.task {
        case .request:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .requestParametrs(let urlParmetrs , let  bodyParametrs):
            try request.configureParameters(bodyParameters: bodyParametrs, urlParameters:  urlParmetrs)
        case .requestParametrsHeaderss(let urlParmetrs,  let bodyParametrs, let headers):
            request.addHeaders(headers: headers)
            try request.configureParameters(bodyParameters: bodyParametrs, urlParameters: urlParmetrs)
        }
        
      return  request
    }
    
}

fileprivate extension URLRequest {
    mutating func configureParameters(bodyParameters: NetworkParametrs?, urlParameters: NetworkParametrs?) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &self, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &self, with: urlParameters)
            }
        } catch {
            throw error
        }
    }

    mutating func addHeaders(headers: HTTPHeaders?) {
        guard let headers = headers else { return }
        for (name, value) in headers {
            setValue(value, forHTTPHeaderField: name)
        }
    }
}

// MARK: - NetworkManager
struct NetworkManager: ResponseDecoder {
    private init() {}
}
