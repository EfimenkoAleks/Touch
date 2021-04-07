//
//  ProjectsPresenter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ProjectsPresenter {
    
    var interactor: ProjectsModuleInteractorProtocol
    weak var view: ProjectsModuleViewProtocol?
    var router: ProjectsModuleRouterProtocol
   
    
    init(
        view: ProjectsModuleViewProtocol? = nil,
        interactor: ProjectsModuleInteractorProtocol,
        router: ProjectsModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension ProjectsPresenter: ProjectsModulePresenterProtocol {
  
}

