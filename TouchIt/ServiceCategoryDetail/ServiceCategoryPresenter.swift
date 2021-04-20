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
    private var modCollection: ModelForServiceCat
    private var logo: Logo
    private var title = "Portfolio"
 //   private var model: TextOverview

    // MARK: - Lifecycle -

    init(logo: Logo, view: ServiceCategoryModuleView, interactor: ServiceCategoryModuleInteractor, router: ServiceCategoryModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.logo = logo
        self.modCollection = ModelForServiceCat(service: [], project: [])
    }
}

// MARK: - Extensions -

extension ServiceCategoryPresenter: ServiceCategoryModulePresenter {
    
    var curentModel: ServiceCategory {
        return self.modCollection.service.first(where: { $0.type == self.logo.logeTitle })!
    }
    
    var titleForHeder: String {
        return self.title
    }
    
    var logoForMainImage: String {
        self.logo.logoImage
    }
    
    var countItem: Int {
        if self.logo.logeTitle == "iOS" || self.logo.logeTitle == "Android" {
            return self.modCollection.project.count
        } else {
            return 0
        }
    }
    
    func iconForIndex(index: Int) -> ProjectModWithImage {
        return self.modCollection.project[index]
    }
    
    func goToNextController (index: Int) {
        return self.router.goToNextController(model: self.modCollection.project.filter({ $0.type == self.logo.logeTitle}))
    }
    
    func fetch() {
    // имитация загрузки
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        DispatchQueue.global().async {
            self.interactor.getServiceModel { (rezult) in
                self.modCollection = ModelForServiceCat(service: rezult.service, project: rezult.project)
                DispatchQueue.main.async {
                    self.view?.updateView()
                }
            }
        }
    }
}
