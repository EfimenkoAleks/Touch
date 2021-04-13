//
//  ServiceCategoryInterfaces.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ServiceCategoryModuleRouter: class {
    
    /// Dismiss presented screen.
//    func dismissPresented(animated: Bool, completion: (() -> Void)?)
}

protocol ServiceCategoryModuleView: class {
}

protocol ServiceCategoryModulePresenter: class {
    var curentModel: TextOverview { get }
    var countItem: Int { get }
    func iconForIndex(index: Int) -> ServiceCategotiEntity
}

protocol ServiceCategoryModuleInteractor: class {
}
