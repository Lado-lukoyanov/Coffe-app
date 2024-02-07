//
//  LocationRequest.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation

extension NetworkManager {
    struct LocationRequest {
        
        private static let router = NetworkRequest<LocationEndpoint>()
        
        static func getCoffe(_ completion: @escaping(Result<[Coffe], DecoderError>) -> Void) {
            router.request(.locatioon) { data, responce, error in
                let result = decode(data: data, response: responce, error: error, type: [Coffe].self)
                completion(result)
            }
        }
        
        static func getMenu(by id: String, completion: @escaping (Result<[Product], DecoderError>) -> Void) {
            router.request(.menu(id: id)) { data, responce, error in
                let result = decode(data: data, response: responce, error: error, type: [Product].self)
                completion(result)

            }
        }

    }
}
