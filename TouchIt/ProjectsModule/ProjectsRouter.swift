//
//  ProjectsRouter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ProjectsRouter {
    
    fileprivate weak var transitionContext: ProjectsViewController?
    
    init(transitionContext: ProjectsViewController?) {
        self.transitionContext = transitionContext
    }
}

extension ProjectsRouter: ProjectsModuleRouterProtocol{

}
