//
//  APIServiceProjectDetail.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseFirestore

protocol APIServiceProjectDetailProtocol {
    func fechProject(completion: @escaping (Result<[ProjectModWithImage]>) -> ())
}

class APIServiceProjectDetailImplementation {
    let db = Firestore.firestore()
}

extension APIServiceProjectDetailImplementation: APIServiceProjectDetailProtocol {
    func fechProject(completion: @escaping (Result<[ProjectModWithImage]>) -> ()) {
        
    }
    
    
}


