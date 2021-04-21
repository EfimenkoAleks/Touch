//
//  ProjectDetailModuleRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//
import Foundation

class ProjectDetailRouter {
    
    fileprivate weak var transitionContext: ProjectDetailViewController?
    
    init(transitionContext: ProjectDetailViewController?) {
        self.transitionContext = transitionContext
    }
}

extension ProjectDetailRouter: ProjectDetailModuleRouterProtocol{
    
    func goToNextScreen(model: ProjectModWithImage) {
        
    }
}
