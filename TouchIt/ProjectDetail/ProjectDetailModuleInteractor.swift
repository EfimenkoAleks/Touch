//
//  ProjectDetailModuleInteractor.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation

class ProjectDetailInteractor {
    
    private let apiService: APIServiceProjectDetailProtocol
    
    init(apiService: APIServiceProjectDetailProtocol) {
        self.apiService = apiService
    }
}

extension ProjectDetailInteractor: ProjectDetailModuleInteractorProtocol {
    func fetchProjectModel(completion: @escaping ([ProjectModWithImage]?) -> ()) {
        
    }
    
   
}
