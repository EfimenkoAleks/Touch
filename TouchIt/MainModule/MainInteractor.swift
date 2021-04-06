//
//  MainInteractor.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import Foundation

class MainInteractor {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}

extension MainInteractor: MainModuleInteractorProtocol {
    
    func getVideo(completion: @escaping(Bool) -> ()) {
        self.apiService.fechMovi { (data) in
            completion(data)
        }
    }
}
