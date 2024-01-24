//
//  ViewController.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobalAppearance()
        setupNavBar()
        setupView()
    }
    
    override func updateViewConstraints() {
        setupConstarint()
        super.updateViewConstraints()
    }

    func setupView(){}
    func setupConstarint(){}
    
    private func setupNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        let barButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        
        barButtonAppearance.normal.titleTextAttributes = [.foregroundColor: Constants.Colors.textBrownColor]

        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = Constants.Colors.navBackColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: Constants.Colors.textBrownColor]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: Constants.Colors.textBrownColor]
        navigationBarAppearance.backButtonAppearance = barButtonAppearance
        navigationBarAppearance.buttonAppearance = barButtonAppearance
        navigationBarAppearance.doneButtonAppearance = barButtonAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = Constants.Colors.textBrownColor
        
    }

}

