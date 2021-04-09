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
    func itemForindex(index: Int) -> ProjectModel
    var itemsForFilter: [ProjectModel] { get }
}

protocol ProjectsModuleInteractorProtocol {
    
}

protocol ProjectsModuleRouterProtocol {
    func goToSecondScreen()
}

