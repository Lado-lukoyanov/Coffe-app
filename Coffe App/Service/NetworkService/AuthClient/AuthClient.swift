//
//  AuthClient.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
extension NetworkManager {
    struct AuthClient {
        private static let router = NetworkRequest<AuthEndpoint>()
        
        static func login(
            _ login: String,
            password: String,
            completion: @escaping (Result<UserSucess, DecoderError>) -> Void
        ){
            router.request(.login(login, password)) { data, responce, error in
                let result = decode(data: data, response: responce, error: error, type: UserSucess.self)
                completion(result)
            }
        }
        
        static func rigsiration(
            _ login: String,
            password: String,
            completion: @escaping (Result<UserSucess, DecoderError>) -> Void
        ){
            router.request(.rigsiration(login, password)) { data, responce, error in
                let result = decode(data: data, response: responce, error: error, type: UserSucess.self)
                completion(result)
            }
        }
    }
}
