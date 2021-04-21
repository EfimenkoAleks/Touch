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
    private var items: [ProjectModWithImage] = []
    private var filterItems: [ProjectModWithImage] = []
    
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

extension ProjectsPresenter {
   
}

extension ProjectsPresenter: ProjectsModulePresenterProtocol {
  
    var countItem: Int {
        return self.items.count
    }
    
    var countItemFiltred: Int {
        return self.filterItems.count
    }
    
    func itemForindex(index: Int) -> ProjectModWithImage {
        return self.items[index]
    }
    
    func itemForIndexFiltring(index: Int) -> ProjectModWithImage {
        return self.filterItems[index]
    }
    
    var itemsForFilter: [ProjectModWithImage] {
        return self.items
    }
    
    func filterContentForSearchText(_ searchText: String) {
        self.filterItems = self.items.filter({ (item: ProjectModWithImage) -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        })
        self.view?.updateView()
    }
    
    func fetchProject() {
        self.interactor.fetchProjectModel { (rezult) in
            guard let rez = rezult else { return }
            self.items = rez
            self.view?.updateView()
        }
    }

}

