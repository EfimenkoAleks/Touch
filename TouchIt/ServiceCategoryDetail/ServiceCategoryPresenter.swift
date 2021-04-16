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
 //   private var model: TextOverview

    // MARK: - Lifecycle -

    init(logo: Logo, view: ServiceCategoryModuleView, interactor: ServiceCategoryModuleInteractor, router: ServiceCategoryModuleRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.logo = logo
        self.modCollection = ModelForServiceCat(service: [], project: [])
  //      self.model = TextOverview(image: "", title: "", text: "")
    }
}

// MARK: - Extensions -

extension ServiceCategoryPresenter: ServiceCategoryModulePresenter {
    
    var curentModel: ServiceCategory {
        return self.modCollection.service.first(where: { $0.type == self.logo.logeTitle })!
    }
    
    var logoForMainImage: String {
        self.logo.logoImage
    }
    
    var countItem: Int {
        return self.modCollection.project.count
    }
    
    func iconForIndex(index: Int) -> ProjectModWithImage {
        return self.modCollection.project[index]
    }
    
    func goToNextController (index: Int) {
        self.router.goToNextController(model: self.modCollection.project[index])
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
            
//            self.modCollection = [ServiceCategotiEntity(title: "Portfolio", icon: "leftIcon"), ServiceCategotiEntity(title: "More", icon: "rightIcon")]
//
//            self.model = TextOverview(image: self.logo.logoImage, title: self.logo.logeTitle, text: "Ipsum labore veniam dolor ea eiusmod aliquip aute minim magna amet nisi nulla commodo mollit dolor aute elit in Lorem tempor eiusmod tempor excepteur sit")
//            self.view?.updateView()
 //       }
        
    }
}
