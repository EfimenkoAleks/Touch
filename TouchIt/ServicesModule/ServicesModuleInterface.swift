//
//  ServicesModuleInterface.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

protocol ServicesModuleViewProtocol: class {
    func updateView()
}

protocol ServicesModulePresenterProtocol {
    var countIcons: Int { get }
    func curentLogo(index: Int) -> Logo
}

protocol ServicesModuleInteractorProtocol {
    
}

protocol ServicesModuleRouterProtocol {
    func goToSecondScreen()
}

