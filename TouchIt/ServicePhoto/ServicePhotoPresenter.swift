//
//  ServicePhotoPresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ServicePhotoPresenter {

    // MARK: - Private properties -

    private weak var view: ServicePhotoModuleView?
    private let interactor: ServicePhotoModuleInteractor
    private let router: ServicePhotoModuleRouter

    // MARK: - Lifecycle -

    init(view: ServicePhotoModuleView, interactor: ServicePhotoModuleInteractor, router: ServicePhotoModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extensions -

extension ServicePhotoPresenter: ServicePhotoModulePresenter {
}
