//
//  APIServis.swift
//  TouchIt
//
//  Created by Trainee Alex on 06.04.2021.
//

import Foundation
import FirebaseStorage

protocol APIServiceProtocol {
    func fechMovi(completion: @escaping(Bool) -> ())
}

class APIServiceImplementation {
   
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIError: Error {
    case noData
}

extension APIServiceImplementation: APIServiceProtocol {
    
    func fechMovi(completion: @escaping(Bool) -> ()) {
        
        let fileName = "video.mp4"
        let storageRef = Storage.storage().reference().child(fileName)
        let megaByte = Int64(1 * 1024 * 1024)
        storageRef.getData(maxSize: megaByte) { (data, error) in
            if error != nil {
                completion(false)
            } else {
                guard let data = data else { return }
                
                let fileManager = FileManager.default
                let documentDir = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let localFile = documentDir.appendingPathComponent(fileName)
                
                //Checks if file exists, removes it if so.
                if FileManager.default.fileExists(atPath: localFile.path) {
                    do {
                        try FileManager.default.removeItem(atPath: localFile.path)
                        print("Removed old image")
                    } catch let removeError {
                        print("couldn't remove file at path", removeError)
                    }
                }
                do {
                    try data.write(to: localFile)
                    print("\(localFile)")
                    completion(true)
                } catch let error {
                    print("error saving file with error", error)
                }
            }

        }
    }
 
}


