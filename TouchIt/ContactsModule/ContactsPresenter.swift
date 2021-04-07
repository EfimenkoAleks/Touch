//
//  ContactsPresenter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ContactsPresenter {
    
    var interactor: ContactsModuleInteractorProtocol
    weak var view: ContactsModuleViewProtocol?
    var router: ContactsModuleRouterProtocol
   
    
    init(
        view: ContactsModuleViewProtocol? = nil,
        interactor: ContactsModuleInteractorProtocol,
        router: ContactsModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension ContactsPresenter: ContactsModulePresenterProtocol {
  
}


