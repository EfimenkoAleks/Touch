//
//  ProjectDetailModuleInterface.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation

protocol ProjectDetailModuleViewProtocol: class {
    func restoreContentOffset()
    func updateView()
}

protocol ProjectDetailModulePresenterProtocol {
    var countElements: Int { get }
    func nextProject()
    func fetchProject()
    func curentModel(by: Int) -> ContentImage
    func didSelectItemAt(index: IndexPath)
}

protocol ProjectDetailModuleInteractorProtocol {
    func fetchPhotos(completion: @escaping ([Data]) -> ())
}

protocol ProjectDetailModuleRouterProtocol {
    func goTonextController(items: [Data], initialItem: Int)
}
