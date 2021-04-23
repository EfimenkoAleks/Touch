//
//  ProjectPageModuleRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import Foundation

class ProjectPageRouter {
    
    fileprivate weak var transitionContext: ProjectPageViewController?
    
    init(transitionContext: ProjectPageViewController?) {
        self.transitionContext = transitionContext
    }
}

extension ProjectPageRouter: ProjectPageModuleRouterProtocol{
   
}
