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
    private var items: [ProjectModel]
    
    init(
        view: ProjectsModuleViewProtocol? = nil,
        interactor: ProjectsModuleInteractorProtocol,
        router: ProjectsModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        var iconss: [ProjectModel] = []
        let icon1 = ProjectModel(icon: "icon1")
            iconss.append(icon1)
        let icon2 = ProjectModel(icon: "icon2")
            iconss.append(icon2)
        let icon3 = ProjectModel(icon: "icon3")
            iconss.append(icon3)
        let icon4 = ProjectModel(icon: "icon4")
            iconss.append(icon4)
        let icon5 = ProjectModel(icon: "icon5")
            iconss.append(icon5)
        let icon6 = ProjectModel(icon: "icon6")
            iconss.append(icon6)
        let icon7 = ProjectModel(icon: "icon7")
            iconss.append(icon7)
        
        self.items = iconss
        
    }
}

extension ProjectsPresenter {
   
}

extension ProjectsPresenter: ProjectsModulePresenterProtocol {
  
    var countItem: Int {
        return self.items.count
    }
    
    func itemForindex(index: Int) -> ProjectModel {
        return self.items[index]
    }
    
    var itemsForFilter: [ProjectModel] {
        return self.items
    }
}

