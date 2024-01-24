//
//  SceneDelegate.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window = ApplicationService.starApplication(in: scene)
    }

}

