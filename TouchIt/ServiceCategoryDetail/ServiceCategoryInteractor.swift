//
//  ServiceCategoryInteractor.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ServiceCategoryInteractor {
    
    private let apiService: APIServiceServicesProtocol
    private let apiProject: APIProjectProtocol
    
    init(apiProject: APIProjectProtocol, apiService: APIServiceServicesProtocol) {
        self.apiService = apiService
        self.apiProject = apiProject
    }
}

// MARK: - Extensions -

extension ServiceCategoryInteractor: ServiceCategoryModuleInteractor {
    func getServiceModel(completed: @escaping(ModelForServiceCat) -> ()) {
        
        var serv: [ServiceCategory] = []
        var proj: [ProjectModWithImage] = []
        self.apiService.fechService { (rezult) in
            if let rezult = rezult {
                serv = rezult
            }
        }
        
        self.apiProject.fechProject { (rezult) in
            if let rezult = rezult {
                proj = rezult
            }
        }
        
        let model = ModelForServiceCat(service: serv, project: proj)
        completed(model)
    }
}
