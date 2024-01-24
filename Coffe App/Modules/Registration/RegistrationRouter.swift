//
//  RegistrationRouter.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
import UIKit

final class RegistrationRouter {
    
    static func createView() -> UIViewController {
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter(interactor: interactor, router: router)
        let view = RegistrationViewController(presenter: presenter)

        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
    weak var view: UIViewController?
}


extension RegistrationRouter: RegistrationRouterInput {
    func showMain() {
        
    }
    
    func showAuth() {
    }
    
}
