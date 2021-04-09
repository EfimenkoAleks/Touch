//
//  APIServis.swift
//  TouchIt
//
//  Created by Trainee Alex on 06.04.2021.
//

import Foundation
import FirebaseStorage

protocol APIServiceProtocol {
    func fechMovi(name: String, completion: @escaping(URL?) -> ())
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
    
    func fechMovi(name: String, completion: @escaping(URL?) -> ()) {
        
        let fileName = URL(string: name)?.lastPathComponent ?? name
        if self.loadImageFromDiskWith(fileName: name) != nil {
            completion(self.loadImageFromDiskWith(fileName: name))
        }
        
        let storageRef = Storage.storage().reference(withPath: "video.mp4")
//        let megaByte = Int64(1 * 1024 * 1024)
        
        storageRef.getData(maxSize: Int64.max) { (data, error) in
            if error != nil {
                completion(nil)
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
                    completion(self.loadImageFromDiskWith(fileName: name))
                } catch let error {
                    print("error saving file with error", error)
                }
            }

        }
    }
    
    private func loadImageFromDiskWith(fileName: String) -> URL? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let videoUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)

//            videoUrl.path

            return videoUrl

        }

        return nil
    }
}


