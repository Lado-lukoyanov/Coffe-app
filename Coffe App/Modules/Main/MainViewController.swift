//
//  MainViewController.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation
import UIKit

final class MainViewController: ViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TableCell.self, forCellReuseIdentifier: identifire)
        return table
    }()
    
    private let identifire = "MainTabelID"
    private var presenter: MainViewOutput
    private var dataPresenter: MainCellDatapresentr
    
    init(presenter:MainViewOutput, dataPresenter: MainCellDatapresentr){
        self.presenter = presenter
        self.dataPresenter = dataPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainViewController: MainViewInput {
    func update() {

    }
    
    func showError(_ messenge: String) {
        self.alertOk(title: "Ошибка", message: messenge)

    }
}
