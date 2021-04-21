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
    private let apiProject: APIServiceServiceProjectProtocol
    
    init(apiProject: APIServiceServiceProjectProtocol, apiService: APIServiceServicesProtocol) {
        self.apiService = apiService
        self.apiProject = apiProject
    }
}

// MARK: - Extensions -

extension ServiceCategoryInteractor: ServiceCategoryModuleInteractor {
    func getServiceModel(completed: @escaping(ModelForServiceCat) -> ()) {
        
        let dispathGroup = DispatchGroup()
        var serv: [ServiceCategory] = []
        var proj: [ProjectModWithImage] = []
        
        dispathGroup.enter()
        self.apiService.fechService { (rezult) in
            if let rezult = rezult {
                serv = rezult
            }
            dispathGroup.leave()
        }
        
        dispathGroup.enter()
        self.apiProject.fechProject { (rezult) in
            switch rezult {
            case .success(let task):
                guard let task = task else { return }
                proj = task
            case .failure( _):
                proj = []
            }
            dispathGroup.leave()
        }
        
        dispathGroup.notify(queue: DispatchQueue.global()) {
            let model = ModelForServiceCat(service: serv, project: proj)
            completed(model)
        }
    }
}
