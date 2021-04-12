//
//  ServiceCategoryWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// swiftlint:disable all

import UIKit

struct ServiceCategoryWireframe {
    static func create() -> UIViewController {
        let view = ServiceCategoryViewController()
        let apiServis = DIConteiner.shared.apiService
        let interactor = ServiceCategoryInteractor(apiService: apiServis)
        let router = ServiceCategoryRouter(transitionContext: view)
        let presenter = ServiceCategoryPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}
