//
//  ContactsModuleInterface.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

protocol ContactsModuleViewProtocol: class {
    func updateView()
}

protocol ContactsModulePresenterProtocol {
    var countSectin: Int { get }
    func contacts() -> [Contact]
    func countRowInSection(section: Int) -> Int
}

protocol ContactsModuleInteractorProtocol {
    
}

protocol ContactsModuleRouterProtocol {
    func goToSecondScreen()
}


