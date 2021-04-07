//
//  MainPresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import Foundation

class MainPresenter {
    
    var interactor: MainModuleInteractorProtocol
    weak var view: MainModuleViewProtocol?
    var router: MainModuleRouterProtocol
    
    
    init(
        view: MainModuleViewProtocol? = nil,
        interactor: MainModuleInteractorProtocol,
        router: MainModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension MainPresenter: MainModulePresenterProtocol {
    
}
