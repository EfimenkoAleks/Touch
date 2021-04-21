//
//  ProjectsWireframe.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

struct ProjectsWireframe {
    static func create(mainDelegate: MainViewController) -> UIViewController {
        let view = ProjectsViewController()
        let apiServis = DIConteiner.shared.apiProject
        let interactor = ProjectsInteractor(apiService: apiServis)
        let router = ProjectsRouter(transitionContext: view)
        let presenter = ProjectsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        view.delegateMain = mainDelegate
        
        let navigation = UINavigationController(rootViewController: view)
        
        return navigation
    }
}


