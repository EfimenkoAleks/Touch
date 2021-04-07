//
//  ContactsRouter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ContactsRouter {
    
    fileprivate weak var transitionContext: ContactsViewController?
    
    init(transitionContext: ContactsViewController?) {
        self.transitionContext = transitionContext
    }
}

extension ContactsRouter: ContactsModuleRouterProtocol{
    
    func goToSecondScreen() {
        
    }
}
