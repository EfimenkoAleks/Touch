//
//  ProjectsModuleInterface.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

protocol ProjectsModuleViewProtocol: class {
    func updateView()
}

protocol ProjectsModulePresenterProtocol {
    var countItem: Int { get }
    var itemsForFilter: [ProjectModel] { get }
    func itemForindex(index: Int) -> ProjectModel
    func filterContentForSearchText(_ searchText: String)
}

protocol ProjectsModuleInteractorProtocol {
    
}

protocol ProjectsModuleRouterProtocol {
    func goToSecondScreen()
}

