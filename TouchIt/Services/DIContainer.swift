//
//  DIContainer.swift
//  TouchIt
//
//  Created by Trainee Alex on 06.04.2021.
//

import Foundation

class DIConteiner {
    static var shared = DIConteiner()
    
    lazy var apiService: APIServiceProtocol = APIServiceImplementation()
}
