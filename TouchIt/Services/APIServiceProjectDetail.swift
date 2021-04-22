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
    func fechPhotos(completion: @escaping (Result<[Data]>) -> ())
}

class APIServiceProjectDetailImplementation {
    let db = Firestore.firestore()
}

extension APIServiceProjectDetailImplementation: APIServiceProjectDetailProtocol {
    
    func fechPhotos(completion: @escaping (Result<[Data]>) -> ()) {
        
        let dispathGroup = DispatchGroup()
        var photos: [Data] = []
        
        for _ in 0..<6 {
            dispathGroup.enter()
        self.load { (data) in
            photos.append(data!)
            dispathGroup.leave()
        }
//            if photos.count == 6 {
//                completion(.success(photos))
//            }
        }
        
        dispathGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(photos))
        }
}
    
    private func load(result: @escaping ((Data?) -> Void)) {
        
        let resource = "https://picsum.photos/200/300"
       
        let url = URL(string: resource)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                guard let data = data else {
                    result(nil)
                    return
                }
                result(data)
            }
        }
        task.resume()
    }
}

