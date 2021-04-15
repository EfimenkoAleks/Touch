//
//  ServicesWireframe.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

struct ServicesWireframe {
    static func create(mainDelegate: MainViewController) -> UIViewController {
        let view = ServicesViewController()
        let apiServis = DIConteiner.shared.apiServiceService
        let interactor = ServicesInteractor(apiService: apiServis)
        let router = ServicesRouter(transitionContext: view)
        let presenter = ServicesPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        view.delegateMain = mainDelegate
        return view
    }
}

