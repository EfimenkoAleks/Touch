//
//  ServiceCategoryInterfaces.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ServiceCategoryModuleRouter: class {
    
    func goToNextController(model: ServiceCategotiEntity)
    /// Dismiss presented screen.
//    func dismissPresented(animated: Bool, completion: (() -> Void)?)
}

protocol ServiceCategoryModuleView: class {
    func updateView()
}

protocol ServiceCategoryModulePresenter: class {
    var curentModel: TextOverview { get }
    var countItem: Int { get }
    func fetch()
    func goToNextController (index: Int)
    func iconForIndex(index: Int) -> ServiceCategotiEntity
}

protocol ServiceCategoryModuleInteractor: class {
}