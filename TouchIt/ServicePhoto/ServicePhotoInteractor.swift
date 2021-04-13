//
//  ServicePhotoInteractor.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ServicePhotoInteractor {

private let apiService: APIServiceProtocol

init(apiService: APIServiceProtocol) {
    self.apiService = apiService
}
}

// MARK: - Extensions -

extension ServicePhotoInteractor: ServicePhotoModuleInteractor {
}
