//
//  ProjectDetailModuleInterface.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation

protocol ProjectDetailModuleViewProtocol: class {
    func updateView()
}

protocol ProjectDetailModulePresenterProtocol {
    var countElements: Int { get }
    func fetchProject()
    func curentModel(by: Int) -> ContentImage
}

protocol ProjectDetailModuleInteractorProtocol {
    func fetchPhotos(completion: @escaping ([Data]) -> ())
}

protocol ProjectDetailModuleRouterProtocol {
   
}
