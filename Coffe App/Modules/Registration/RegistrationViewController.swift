//
//  RegistrationViewController.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import UIKit

final class RegistrationViewController: ViewController {
    
    private lazy var emailLabel = CreateLabele(
        nameLabel: Constants.Text.email,
        size: 15,
        color: Constants.Colors.textBrownColor
    )
    
    private lazy var buttonRegistration = CreateButton(
        name: Constants.Text.registration)

    private lazy var passwordLabel = CreateLabele(
        nameLabel: Constants.Text.password,
        size: 15,
        color: Constants.Colors.textBrownColor
    )
    private lazy var returnPasswordLabel = CreateLabele(
        nameLabel: Constants.Text.returnPassword,
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
    private lazy var returnTextFiled = CreateTextFiled(
        placeholder: "*******",
        height: 47
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

    private lazy var thirdVerticalStakView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(returnPasswordLabel)
        stack.addArrangedSubview(returnTextFiled)
        stack.addArrangedSubview(buttonRegistration)
        return stack
    }()

    
    var presenter: RegistrationViewOutput

    init(presenter: RegistrationViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        navigationItem.title = Constants.Text.registration
        view.addSubview(firstVerticalStakView)
        view.addSubview(secondVerticalStakView)
        view.addSubview(thirdVerticalStakView)
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

            thirdVerticalStakView.topAnchor.constraint(equalTo: secondVerticalStakView.bottomAnchor, constant: 24),
            thirdVerticalStakView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            thirdVerticalStakView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),


        ])
    }
}

extension RegistrationViewController: RegistrationViewInput {
    func showError(_ message: String) {
        self.alertOk(title: "error", message: message)
    }
}

