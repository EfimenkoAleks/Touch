//
//  ProjectPageModuleInterface.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import Foundation

protocol ProjectPageModuleViewProtocol: class {
    func updateView()
}

protocol ProjectPageModulePresenterProtocol {
    var countPhoto: Int { get }
    var curentIndex: Int { get }
    func curentPhoto(index: Int) -> Data
}

protocol ProjectPageModuleInteractorProtocol {
  
}

protocol ProjectPageModuleRouterProtocol {
   
}
