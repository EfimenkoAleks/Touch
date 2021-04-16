//
//  ContactsWireframe.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

struct ContactsWireframe {
    static func create() -> UIViewController {
        let view = ContactsViewController()
        let apiServis = DIConteiner.shared
        let interactor = ContactsInteractor(apiService: apiServis.apiContacts)
        let router = ContactsRouter(transitionContext: view)
        let presenter = ContactsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}

