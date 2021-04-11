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
    private var contactss: [Contact] = []
    
    init(
        view: ContactsModuleViewProtocol? = nil,
        interactor: ContactsModuleInteractorProtocol,
        router: ContactsModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.contactss = [
        Contact(titl: "Touch IT", contact: CurentContact(place: "6887 Sunset St undefined South 71890", phone: "(219) 555-0114", mail: "isaac.gibson@example.com")),
            Contact(titl: "Shane Murpy", contact: CurentContact(place: "6887 Sunset St undefined South 71890", phone: "(219) 555-0114", mail: "isaac.gibson@example.com")),
            Contact(titl: "Gloria Steward", contact: CurentContact(place: "6887 Sunset St undefined South 71890", phone: "(219) 555-0114", mail: "isaac.gibson@example.com"))
        ]
    }
    
}

extension ContactsPresenter: ContactsModulePresenterProtocol {
    var countSectin: Int {
        return self.contactss.count
    }
    
    func contacts() -> [Contact] {
        return self.contactss
    }
    func countRowInSection(section: Int) -> Int {
        return 3
    }
}


