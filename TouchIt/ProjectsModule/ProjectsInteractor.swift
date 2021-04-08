//
//  ProjectsInteractor.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ProjectsInteractor {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}

extension ProjectsInteractor: ProjectsModuleInteractorProtocol {
    
}