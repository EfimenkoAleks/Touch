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
    private var modCollection: [ServiceCategotiEntity] = []
//    private var bigImage: String
    private var model: TextOverview

    // MARK: - Lifecycle -

    init(logo: Logo, view: ServiceCategoryModuleView, interactor: ServiceCategoryModuleInteractor, router: ServiceCategoryModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
//        self.bigImage = icon
        self.modCollection = [ServiceCategotiEntity(title: "Portfolio", icon: "leftIcon"), ServiceCategotiEntity(title: "More", icon: "rightIcon")]
        
        self.model = TextOverview(image: logo.logoImage, title: logo.logeTitle, text: "Ipsum labore veniam dolor ea eiusmod aliquip aute minim magna amet nisi nulla commodo mollit dolor aute elit in Lorem tempor eiusmod tempor excepteur sit")
    }
}

// MARK: - Extensions -

extension ServiceCategoryPresenter: ServiceCategoryModulePresenter {
    
    var curentModel: TextOverview {
        return self.model
    }
    
    var countItem: Int {
       return self.modCollection.count
    }
    
    func iconForIndex(index: Int) -> ServiceCategotiEntity {
       return self.modCollection[index]
    }
}
