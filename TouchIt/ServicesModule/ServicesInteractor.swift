//
//  ServicesInteractor.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ServicesInteractor {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}

extension ServicesInteractor: ServicesModuleInteractorProtocol {
    
}