//
//  MainRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import Foundation

class MainRouter {
    
    fileprivate weak var transitionContext: MainViewController?
    
    init(transitionContext: MainViewController?) {
        self.transitionContext = transitionContext
    }
}

extension MainRouter: MainModuleRouterProtocol{
    
    func goToSecondScreen() {
        
    }
}
