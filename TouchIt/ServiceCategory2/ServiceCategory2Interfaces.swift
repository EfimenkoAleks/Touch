//
//  ServiceCategory2Interfaces.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ServiceCategory2ModuleRouter: class {
    
    /// Dismiss presented screen.
 //   func dismissPresented(animated: Bool, completion: (() -> Void)?)
}

protocol ServiceCategory2ModuleView: class {
    func updateView()
}

protocol ServiceCategory2ModulePresenter: class {
    var countItems: Int { get }
    func curentItem(index: Int) -> Data?
    func getPhoto()
}

protocol ServiceCategory2ModuleInteractor: class {
 //   func gethoto(completion: @escaping (URL?) -> ())
}
