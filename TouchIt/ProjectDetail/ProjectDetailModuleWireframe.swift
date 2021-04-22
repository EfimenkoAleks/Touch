//
//  ProjectDetailModuleWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import UIKit

struct ProjectDetailWireframe {
    static func create(model: [ProjectModWithImage], index: Int) -> UIViewController {
        let view = ProjectDetailViewController()
        let apiServis = DIConteiner.shared.apiProjectDetail
        let interactor = ProjectDetailInteractor(apiService: apiServis)
        let router = ProjectDetailRouter(transitionContext: view)
        let presenter = ProjectDetailPresenter(model: model, index: index, view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
//        let navigation = UINavigationController(rootViewController: view)
        
        return view
    }
}
