//
//  AuthPresenter.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

final class AuthPresenter {
    
    weak var view: AuthViewInput?
    var interactor: AuthInteractorInput
    var router: AuthRouterInput
    
    init(interactor: AuthInteractorInput, router: AuthRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension AuthPresenter: AuthViewOutput {
    func loginButton(with login: String?, password: String?) {
        interactor.login(login: login, password: password)
    }
}

extension AuthPresenter: AuthInteractorOutput {
    func authSuccess() {
        
    }
    
    func authFailed(withError message: String) {
        view?.shwoError(message)
    }
    
    
}
