//
//  ServiceCategoryInterfaces.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ServiceCategoryModuleRouter: class {
    
    func goToNextController(model: [ProjectModWithImage])
    /// Dismiss presented screen.
//    func dismissPresented(animated: Bool, completion: (() -> Void)?)
}

protocol ServiceCategoryModuleView: class {
    func updateView()
}

protocol ServiceCategoryModulePresenter: class {
    var curentModel: ServiceCategory { get }
    var countItem: Int { get }
    var logoForMainImage: String { get }
    func fetch()
    func goToNextController (index: Int)
    func iconForIndex(index: Int) -> ProjectModWithImage
}

protocol ServiceCategoryModuleInteractor: class {
    func getServiceModel(completed: @escaping(ModelForServiceCat) -> ())
}
