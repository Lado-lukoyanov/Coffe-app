//
//  AuthProtocol.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

protocol AuthViewInput: AnyObject {
    func shwoError(_ error: String)
}

protocol AuthViewOutput {
    func loginButton(with login: String?, password: String?)
}

protocol AuthInteractorInput {
    func login(login: String?, password: String? )
}

protocol AuthInteractorOutput: AnyObject {
    func authSuccess()
    func authFailed(withError message: String)
}

protocol AuthRouterInput {
    func showMAinScreen()
}
