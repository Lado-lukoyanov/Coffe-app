//
//  RegistrationRouter.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
import UIKit

final class RegistrationRouter {
    
    static func createView() -> UINavigationController {
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter(interactor: interactor, router: router)
        let view = RegistrationViewController(presenter: presenter)
        
        let navController = UINavigationController(rootViewController: view)
        
        presenter.view = view
        interactor.presenter = presenter
        router.navController = navController
        
        return navController
    }
    
    weak var navController: UINavigationController?
}


extension RegistrationRouter: RegistrationRouterInput {
    func showAuth() {
        navController?.pushViewController(AuthRouter.createAuth(), animated: true)
    }
    
}
