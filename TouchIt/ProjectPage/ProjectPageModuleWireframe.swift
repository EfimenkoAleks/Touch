//
//  ProjectPageModuleWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import UIKit

struct ProjectPageWireframe {
    static func create(model: [Data], initialItem: Int) -> UIViewController {
        let view = ProjectPageViewController()
        let interactor = ProjectPageInteractor()
        let router = ProjectPageRouter(transitionContext: view)
        let presenter = ProjectPagePresenter(model: model, initialItem: initialItem, view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
//        let navigation = UINavigationController(rootViewController: view)
        
        return view
    }
}
