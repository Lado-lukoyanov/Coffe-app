//
//  RegistrationPresentor.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

final class RegistrationPresenter {


    private var interactor: RegistrationInteractorInput
    private var router: RegistrationRouterInput
    
    weak var view: RegistrationViewInput?


    init(interactor: RegistrationInteractorInput, router: RegistrationRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}


extension RegistrationPresenter: RegistrationViewOutput {
    func registerButtonTapped(login: String?, password: String?, confirmPassword: String?) {
        interactor.registerNewUser(login, password: password, confirmPassword: confirmPassword)
    }
    
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    func registrationSuccess() {
        router.showAuth()
        
    }
    func registrationFailed(withError message: String) {
        view?.showError(message)
    }
    
}
