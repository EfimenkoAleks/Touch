//
//  ServiceCategoryPresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ServiceCategoryPresenter {

    // MARK: - Private properties -

    private weak var view: ServiceCategoryModuleView?
    private let interactor: ServiceCategoryModuleInteractor
    private let router: ServiceCategoryModuleRouter

    // MARK: - Lifecycle -

    init(view: ServiceCategoryModuleView, interactor: ServiceCategoryModuleInteractor, router: ServiceCategoryModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extensions -

extension ServiceCategoryPresenter: ServiceCategoryModulePresenter {
}
