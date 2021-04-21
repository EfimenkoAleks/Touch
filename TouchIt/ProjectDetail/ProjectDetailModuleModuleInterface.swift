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
    
    func fetchProject()
}

protocol ProjectDetailModuleInteractorProtocol {
  
}

protocol ProjectDetailModuleRouterProtocol {
   
}
