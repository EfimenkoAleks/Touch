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
            Contact(titl: "Touch IT", contact: [.place("6887 Sunset St undefined South 71890"), .phone("(219) 555-0114"), .mail("isaac.gibson@example.com")] ),
            Contact(titl: "Shane Murphy", contact: [.place("6887 Sunset St undefined South 71890"), .phone("(480) 555-0103"), .mail("wesley.white@example.com")] ),
            Contact(titl: "Gloria Steward", contact: [.place("6887 Sunset St undefined South 71890"), .phone("(671) 555-0110"), .mail("brandy.franklin@example.com")] )
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
    func curentContact(index: Int) -> Contact {
        return self.contactss[index]
    }
    func countRowInSection(section: Int) -> Int {
        return 3
    }
}


