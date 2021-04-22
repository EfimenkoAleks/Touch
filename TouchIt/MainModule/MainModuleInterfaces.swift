//
//  MainModuleInterfaces.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import UIKit

protocol MainModuleViewProtocol: class {
    func updateView()
}

protocol MainModulePresenterProtocol {
    
}

protocol MainModuleInteractorProtocol {
   
}

protocol MainModuleRouterProtocol {
   
}

protocol TransitionServiceToNextDelegate: class {
    func goToNext(logo: Logo)
}

protocol TransitionProjectToNextDelegate: class {
    func goToNext(model: [ProjectModWithImage], index: Int)
}
