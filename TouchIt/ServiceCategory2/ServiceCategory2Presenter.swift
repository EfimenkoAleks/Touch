//
//  ServiceCategory2Presenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ServiceCategory2Presenter {

    // MARK: - Private properties -

    private weak var view: ServiceCategory2ModuleView?
    private let interactor: ServiceCategory2ModuleInteractor
    private let router: ServiceCategory2ModuleRouter
    private var model: ServiceCategotiEntity
    private var image: URL?

    // MARK: - Lifecycle -

    init(model: ServiceCategotiEntity, view: ServiceCategory2ModuleView, interactor: ServiceCategory2ModuleInteractor, router: ServiceCategory2ModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.model = model
        image = URL(string: "")
    }
}

// MARK: - Extensions -

extension ServiceCategory2Presenter: ServiceCategory2ModulePresenter {
    
    var countItems: Int {
        return 10
    }
    
    func curentItem(index: Int) -> URL {
        self.image!
    }
    
    func getPhoto() {
        self.interactor.gethoto { (url) in
            if url != nil {
                self.image = url!
                self.view?.updateView()
            }
        }
    }
}