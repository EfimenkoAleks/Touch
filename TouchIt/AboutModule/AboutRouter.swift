//
//  AboutRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import Foundation

class AboutRouter {
    
    fileprivate weak var transitionContext: AboutViewController?
    
    init(transitionContext: AboutViewController?) {
        self.transitionContext = transitionContext
    }
}

extension AboutRouter: AboutModuleRouterProtocol{
    
    func goToSecondScreen() {
        
    }
}
