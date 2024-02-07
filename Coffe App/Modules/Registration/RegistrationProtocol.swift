//
//  RegistrationProtocol.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

protocol RegistrationViewInput: AnyObject {
    func showError(_ message: String)
}

protocol RegistrationViewOutput {
    func registerButtonTapped(login: String?, password: String?, confirmPassword: String?)
}

protocol RegistrationInteractorInput {
    func registerNewUser(_ login: String?, password: String?, confirmPassword: String?)
}

protocol RegistrationInteractorOutput: AnyObject {
    func registrationSuccess()
    func registrationFailed(withError message: String)
}

protocol RegistrationRouterInput {
    func showAuth()
}
