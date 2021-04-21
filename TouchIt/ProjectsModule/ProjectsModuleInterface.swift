//
//  ProjectsModuleInterface.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

protocol ProjectsModuleViewProtocol: class {
    func updateView()
}

protocol ProjectsModulePresenterProtocol {
    var countItem: Int { get }
    var countItemFiltred: Int { get }
    var itemsForFilter: [ProjectModWithImage] { get }
    func itemForIndexFiltring(index: Int) -> ProjectModWithImage
    func itemForindex(index: Int) -> ProjectModWithImage
    func filterContentForSearchText(_ searchText: String)
    func fetchProject()
}

protocol ProjectsModuleInteractorProtocol {
    func fetchProjectModel(completion: @escaping ([ProjectModWithImage]?) -> ())
}

protocol ProjectsModuleRouterProtocol {
    func goToNextScreen(model: ProjectModWithImage)
}

