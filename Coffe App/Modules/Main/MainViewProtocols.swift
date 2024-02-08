//
//  MainViewProtocols.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation


protocol MainViewInput: AnyObject {
    func update()
    func showError(_ messenge: String)
}

protocol MainViewOutput {
    func viewDidAppear()
    func tappedMapButton()
    func didSelectRow(of index: Int)
}

protocol MainInteractorInput {
    var dataCount: Int {get}
    func fetchData()
    func coffeName(for index: Int) -> String
    func coffeId(for index: Int) -> String
}

protocol MainInteractorOutput: AnyObject {
    func present()
    func present(error: String)
}

protocol MainRouterInput {
    func showMap()
    func showDitail(id: String)
}

protocol MainCellDatapresentr {
    var count: Int {get}
    func config(_ cell: TableCellInput, for index: Int)
}
