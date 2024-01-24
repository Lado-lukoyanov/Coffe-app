//
//  RegistrationIntersaptor.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

final class RegistrationInteractor {
    
    weak var presenter: RegistrationInteractorOutput?

    private func isTruePassword(_ password: String, _ confirmPassword: String)-> Bool {
        password == confirmPassword
    }
    
    private func errorMessenge(error: DecoderError) {
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
        presenter?.registrationFailed(withError: errorMessage)
        
    }
    
}

extension RegistrationInteractor: RegistrationInteractorInput {
    func registerNewUser(_ email: String?, password: String?, confirmPassword conformPassword: String?) {
        guard
            let email = email,
            let pass = password,
            let confPassword = conformPassword
        else {
            presenter?.registrationFailed(withError: "Заполните обязательные поля")
            return
        }
        
        guard isTruePassword(pass, confPassword)  else {
            presenter?.registrationFailed(withError: "Пароли не совпадают")
            return
        }
        
        NetworkManager.AuthClient.rigsiration(email, password: pass) { [weak self] result in
            switch result {
            case.success(let token):
                return UserService.shared.token = token
                self?.presenter?.registrationSuccess()
            case .failure(let error):
                self?.errorMessenge(error: error)
            }
        }
    }
}
