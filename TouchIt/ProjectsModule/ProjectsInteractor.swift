//
//  ProjectsInteractor.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ProjectsInteractor {
    
    private let apiService: APIServiceProjectProtocol
    
    init(apiService: APIServiceProjectProtocol) {
        self.apiService = apiService
    }
}

extension ProjectsInteractor: ProjectsModuleInteractorProtocol {
    func fetchProjectModel(completion: @escaping ([ProjectModWithImage]?) -> ()) {
        self.apiService.fechProject { (rezult) in
            switch rezult {
            case .success(let task):
                completion(task)
            case .failure( _):
                completion(nil)
            }
        }
    }
}
