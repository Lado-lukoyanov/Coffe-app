//
//  AuthIntersaptor.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

final class AuthIntersaptor {
    
    weak var presenter: AuthInteractorOutput?
    
    private func handleError(error: DecoderError) {
        var errorMessage: String
        
        switch error {
            case .connectionRefused:
                errorMessage = "Нет интернет-соединения"
            case .missingData:
                errorMessage = "Ошибка получения данных"
            case .badResponse(let code):
                switch code {
                    case 400:
                        errorMessage = "Ошибка в запросе"
                   case 406:
                       errorMessage = "Такой логин уже используется"
                   default:
                       errorMessage = "Неизвестный ответ сервера: код \(code)"
                   }
            case .decodingFailure:
                errorMessage = "Ошибка формата данных"
            case .serverError(let text):
                errorMessage = "Ошибка сервера: \(text)"
        }
        presenter?.authFailed(withError: errorMessage)
    }
}

extension AuthIntersaptor: AuthInteractorInput {
    func login(login: String?,password: String?) {
        guard let login = login, let password = password else {
            presenter?.authFailed(withError: "Заполните обязательные поля")
            return
        }
        NetworkManager.AuthClient.login(login, password: password) { [weak self] result  in
            switch result {
            case.success(let token):
                UserService.shared.token = token
                self?.presenter?.authSuccess()
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    
}
