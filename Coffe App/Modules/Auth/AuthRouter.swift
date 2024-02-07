//
//  AuthRouter.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation
import UIKit

final class AuthRouter {
    
    static func createAuth() -> UIViewController {
        
        let interactor = AuthIntersaptor()
        let router = AuthRouter()
        let presenter = AuthPresenter(interactor: interactor, router: router)
        let view = AuthViewController(presenter: presenter)
    
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
        
    }
    
    weak var view: UIViewController?
}
extension AuthRouter: AuthRouterInput {
    func showMAinScreen() {
    } 
    
}
