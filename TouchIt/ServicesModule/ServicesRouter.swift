//
//  ServicesRouter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ServicesRouter {
    
    fileprivate weak var transitionContext: ServicesViewController?
    
    init(transitionContext: ServicesViewController?) {
        self.transitionContext = transitionContext
    }
}

extension ServicesRouter: ServicesModuleRouterProtocol{
    
    func goToSecondScreen() {
        
    }
}

