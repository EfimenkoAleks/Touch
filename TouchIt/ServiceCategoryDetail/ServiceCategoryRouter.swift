//
//  ServiceCategoryRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ServiceCategoryRouter {

/// Controller which is used to perform presentations.
    weak var transitionContext: UIViewController?
    
    init(transitionContext: ServiceCategoryViewController?) {
        self.transitionContext = transitionContext
    }
        
//    func dismissPresented(animated: Bool, completion: (() -> Void)?) {
//        transitionContext?.dismiss(animated: animated, completion: completion)
//    }
}

extension ServiceCategoryRouter: ServiceCategoryModuleRouter {
    
    func goToNextController(model: [ProjectModWithImage]) {
        
        let view = ServiceCategory2Wireframe.create(model: model)
        transitionContext?.navigationController?.pushViewController(view, animated: true)
    }
}

