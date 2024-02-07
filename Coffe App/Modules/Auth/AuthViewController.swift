//
//  AuthViewController.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import UIKit

final class AuthViewController: ViewController {
    
    private lazy var emailLabel = CreateLabele(
        nameLabel: Constants.Text.email,
        size: 15,
        color: Constants.Colors.textBrownColor
    )
    
    private lazy var passwordLabel = CreateLabele(
        nameLabel: Constants.Text.password,
        size: 15,
        color: Constants.Colors.textBrownColor
    )
    
    private lazy var emailTextFiled = CreateTextFiled(
        placeholder: Constants.Text.emailText,
        height: 47
    )
    
    private lazy var passwordTextFiled = CreateTextFiled(
        placeholder: "*******",
        height: 47
    )
    
    private lazy var buttonAuth = CreateButton(
        name: Constants.Text.authButton,
        color: Constants.Colors.buttonBrownColor,
        textColor: Constants.Colors.buttonTextColor
    )
    
    private lazy var firstVerticalStakView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(emailLabel)
        stack.addArrangedSubview(emailTextFiled)
        return stack
    }()

    private lazy var secondVerticalStakView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(passwordLabel)
        stack.addArrangedSubview(passwordTextFiled)
        return stack
    }()
    
    var presenter: AuthViewOutput
    
    init(presenter: AuthViewOutput){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        navigationItem.title = Constants.Text.auth
        view.addSubview(firstVerticalStakView)
        view.addSubview(secondVerticalStakView)
        view.addSubview(buttonAuth)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem

    }
    
    override func setupConstarint() {
        createConstraints()

    }

    func createConstraints() {
        NSLayoutConstraint.activate([
            firstVerticalStakView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstVerticalStakView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            firstVerticalStakView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            secondVerticalStakView.topAnchor.constraint(equalTo: firstVerticalStakView.bottomAnchor, constant: 24),
            secondVerticalStakView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            secondVerticalStakView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            
            buttonAuth.topAnchor.constraint(equalTo: secondVerticalStakView.bottomAnchor, constant: 34),
            buttonAuth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            buttonAuth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),


        ])
    }
}

extension AuthViewController: AuthViewInput {
    func shwoError(_ error: String) {
        self.alertOk(title: "Ошибка", message: error)
    }
}
