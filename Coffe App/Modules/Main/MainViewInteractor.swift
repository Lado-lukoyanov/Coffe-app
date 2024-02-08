//
//  MainViewInteractor.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation
import CoreLocation

final class MainViewInteractor {
    
    weak var presenter: MainInteractorOutput?
    private var data = [Coffe]()
    
    private func handle(_ error: DecoderError) {
        var errorMessage: String
        
        switch error {
            
        case .connectionRefused:
            errorMessage = "Нет интернет-соединения"
        case .missingData:
            errorMessage = "Нет ближайших кофейн"
        case .badResponse(code: let code):
            if code == 401 {
                errorMessage = "Пользователь не авторизован"
            } else {
                errorMessage = "Неизвестный ответ сервера: код \(code)"
            }
        case .decodingFailure:
            errorMessage = "Ошибка формата данных"
        case .serverError(text: let text):
            errorMessage = "Ошибка сервера: \(text)"
        }
        
        presenter?.present(error: errorMessage)
    }
    
}

extension MainViewInteractor: MainInteractorInput{
    var dataCount: Int { data.count }
    
    func fetchData() {
        NetworkManager.LocationRequest.getCoffe { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                self?.presenter?.present()
            case .failure(let error):
                self?.handle(error)
            }
        }
    }
    
    func coffeName(for index: Int) -> String {
        return data[index].name
    }
    
    func coffeId(for index: Int) -> String {
        return data[index].id

    }
}
