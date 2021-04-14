//
//  ServiceCategory2Interactor.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ServiceCategory2Interactor {
    
    private let apiService: APIServicePhotoProtocol
    
    init(apiService: APIServicePhotoProtocol) {
        self.apiService = apiService
    }
}

// MARK: - Extensions -

extension ServiceCategory2Interactor: ServiceCategory2ModuleInteractor {
    
    func gethoto(completion: @escaping (URL?) -> ()) {
        self.apiService.fechPhoto { (url) in
            completion(url)
        }
    }
    
}
