//
//  ServicePhotoRouter.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ServicePhotoRouter {

    fileprivate weak var transitionContext: ServicePhotoViewController?
    
    init(transitionContext: ServicePhotoViewController?) {
        self.transitionContext = transitionContext
    }
        
//    func dismissPresented(animated: Bool, completion: (() -> Void)?) {
//        transitionHandler?.dismiss(animated: animated, completion: completion)
//    }
}

extension ServicePhotoRouter: ServicePhotoModuleRouter {
    
}

