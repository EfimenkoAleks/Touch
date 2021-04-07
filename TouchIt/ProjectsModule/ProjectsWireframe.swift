//
//  ProjectsWireframe.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

struct ProjectsWireframe {
    static func create() -> UIViewController {
        let view = ProjectsViewController()
        let apiServis = DIConteiner.shared.apiService
        let interactor = ProjectsInteractor(apiService: apiServis)
        let router = ProjectsRouter(transitionContext: view)
        let presenter = ProjectsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}


