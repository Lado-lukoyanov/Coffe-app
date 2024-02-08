//
//  MainViewPresenter.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 07.02.2024.
//

import Foundation

final class MainViewPresenter {
    
    weak var view: MainViewInput?
    var interactor: MainInteractorInput
    var router: MainRouterInput
    
    init(interactor: MainInteractorInput, router: MainRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainViewPresenter: MainViewOutput {
    func viewDidAppear() {
        interactor.fetchData()
    }
    
    func tappedMapButton() {
    }
    
    func didSelectRow(of index: Int) {
        router.showDitail(id: interactor.coffeId(for: index))
    }
}

extension MainViewPresenter: MainInteractorOutput {
    func present() {
        view?.update()
    }
    
    func present(error: String) {
        view?.showError(error)
    }
}

extension MainViewPresenter: MainCellDatapresentr {
    var count: Int { interactor.dataCount }
    
    func config(_ cell: TableCellInput, for index: Int) {
        cell.title = interactor.coffeName(for: index)
        cell.handler = nil
    }
    
}
