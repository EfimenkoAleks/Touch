//
//  ProjectDetailModulePresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation

class ProjectDetailPresenter {
    
    var interactor: ProjectDetailModuleInteractorProtocol
    weak var view: ProjectDetailModuleViewProtocol?
    var router: ProjectDetailModuleRouterProtocol
    private var model: ProjectModWithImage
    
    init(model: ProjectModWithImage,
        view: ProjectDetailModuleViewProtocol? = nil,
        interactor: ProjectDetailModuleInteractorProtocol,
        router: ProjectDetailModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.model = model
    }
}

extension ProjectDetailPresenter: ProjectDetailModulePresenterProtocol {
    func fetchProject() {
        
    }
    
    
}
