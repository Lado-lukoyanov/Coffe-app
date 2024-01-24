//
//  ApplicationService.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

import Foundation
import UIKit
import YandexMapKit

protocol ApplicationServiceProtocol {
    static func starApplication(in scene: UIScene) -> UIWindow?
}

final class ApplicationService: ApplicationServiceProtocol  {
    static func starApplication(in scene: UIScene) -> UIWindow? {
        guard let windowScene = (scene as? UIWindowScene) else { return nil }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: RegistrationRouter.createView()) 
        window.makeKeyAndVisible()
        return window

//        if UserService.shared.isUserRigistration() {
//        }
        
    }
    
  
}
