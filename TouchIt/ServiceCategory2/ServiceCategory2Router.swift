//
//  ServiceCategory2Router.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ServiceCategory2Router {

/// Controller which is used to perform presentations.
    weak var transitionContext: UIViewController?
    
    init(transitionContext: ServiceCategory2ViewController?) {
        self.transitionContext = transitionContext
    }
        
//    func dismissPresented(animated: Bool, completion: (() -> Void)?) {
//        transitionHandler?.dismiss(animated: animated, completion: completion)
//    }
}

extension ServiceCategory2Router: ServiceCategory2ModuleRouter {
    
}

