//
//  AboutInteractor.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import Foundation

class AboutInteractor {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}

extension AboutInteractor: AboutModuleInteractorProtocol {
    
    func getVideo(name: String, completion: @escaping(URL?) -> ()) {
        self.apiService.fechMovi(name: name) { (rezult) in
            completion(rezult)
        }
    }
}
