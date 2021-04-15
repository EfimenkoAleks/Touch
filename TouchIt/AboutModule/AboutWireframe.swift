//
//  AboutWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import UIKit

struct AboutWireframe {
    static func create() -> UIViewController {
        let view = AboutViewController()
        let apiServis = DIConteiner.shared.apiServiceAbout
        let interactor = AboutInteractor(apiService: apiServis)
        let router = AboutRouter(transitionContext: view)
        let presenter = AboutPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}
