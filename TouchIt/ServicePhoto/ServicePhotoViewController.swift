//
//  ServicePhotoViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ServicePhotoViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ServicePhotoModulePresenter!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension ServicePhotoViewController: ServicePhotoModuleView {
}
