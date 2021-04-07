//
//  ServicesPresenter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ServicesPresenter {
    
    var interactor: ServicesModuleInteractorProtocol
    weak var view: ServicesModuleViewProtocol?
    var router: ServicesModuleRouterProtocol
   
    
    init(
        view: ServicesModuleViewProtocol? = nil,
        interactor: ServicesModuleInteractorProtocol,
        router: ServicesModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension ServicesPresenter: ServicesModulePresenterProtocol {
  
}
