//
//  DIContainer.swift
//  TouchIt
//
//  Created by Trainee Alex on 06.04.2021.
//

import Foundation

class DIConteiner {
    static var shared = DIConteiner()
    
    lazy var apiServiceAbout: APIServiceProtocol = APIServiceImplementation()
    lazy var apiService: APIServiceServicesProtocol = APIServiceServicesImplementation()
    lazy var apiServiceProj: APIServiceServiceProjectProtocol = APIServiceServiceProjectImplementation()
    lazy var apiProject: APIServiceProjectProtocol = APIServiceProjectImplementation()
    lazy var apiContacts: APIServiceContactsProtocol = APIServiceContactsImplementation()
    lazy var apiProjectDetail: APIServiceProjectDetailProtocol = APIServiceProjectDetailImplementation()
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIError: Error {
    case noData
}
