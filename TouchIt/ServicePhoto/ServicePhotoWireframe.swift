//
//  ServicePhotoWireframe.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// swiftlint:disable all

import UIKit

final class ServicePhotoWireframe {

    public struct ServicePhotoModule {
        let view: UIViewController
        let presenter: ServicePhotoModulePresenter
        let interactor: ServicePhotoModuleInteractor
        let router: ServicePhotoModuleRouter
    }

    // MARK: - Module setup -

    static func create() -> UIViewController {
        let view = ServicePhotoViewController()
        let apiServis = DIConteiner.shared.apiService
        let interactor = ServicePhotoInteractor(apiService: apiServis)
        let router = ServicePhotoRouter(transitionContext: view)
        let presenter = ServicePhotoPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }

}
