//
//  ServiceCategory2Wireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// swiftlint:disable all

import UIKit

final class ServiceCategory2Wireframe {

    // MARK: - Module setup -

    static func create(model: ProjectModWithImage) -> UIViewController {
        let view = ServiceCategory2ViewController()
        let apiServis = DIConteiner.shared.apiProject
        let interactor = ServiceCategory2Interactor(apiService: apiServis)
        let router = ServiceCategory2Router(transitionContext: view)
        let presenter = ServiceCategory2Presenter(model : model, view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }

}
