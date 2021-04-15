//
//  ServicesInteractor.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ServicesInteractor {
    
    private let apiService: APIServiceServicesProtocol
    
    init(apiService: APIServiceServicesProtocol) {
        self.apiService = apiService
    }
}

extension ServicesInteractor: ServicesModuleInteractorProtocol {
    
}
