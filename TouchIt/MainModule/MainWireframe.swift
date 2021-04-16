//
//  MainWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import UIKit

struct MainWireFrame {
    static func create() -> UIViewController {
        let view = MainViewController()
        let apiServis = DIConteiner.shared.apiServiceAbout
        let interactor = MainInteractor(apiService: apiServis)
        let router = MainRouter(transitionContext: view)
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}
