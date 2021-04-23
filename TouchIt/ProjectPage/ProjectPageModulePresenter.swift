//
//  ProjectPageModulePresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import Foundation

class ProjectPagePresenter {
    
    var interactor: ProjectPageModuleInteractorProtocol
    weak var view: ProjectPageModuleViewProtocol?
    var router: ProjectPageModuleRouterProtocol
    private var model: [Data]
    private var index: Int
    private var projectModel: [Data] = []
    
    init(model: [Data], initialItem: Int,
        view: ProjectPageModuleViewProtocol? = nil,
        interactor: ProjectPageModuleInteractorProtocol,
        router: ProjectPageModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.model = model
        self.index = initialItem
    }
}

extension ProjectPagePresenter: ProjectPageModulePresenterProtocol {
    
}
