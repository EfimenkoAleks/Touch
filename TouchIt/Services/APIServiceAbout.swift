//
//  APIServiceAbout.swift
//  TouchIt
//
//  Created by Trainee Alex on 15.04.2021.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

protocol APIServiceProtocol {
    func fechMovi(name: String, completion: @escaping(URL?) -> ())
    func fechMovi2(name: String, completion: @escaping(AboutModel?) -> ())
}

class APIServiceImplementation {
    let db = Firestore.firestore()
}

extension APIServiceImplementation: APIServiceProtocol {
    
    func fechMovi(name: String, completion: @escaping(URL?) -> ()) {
        
        let fileName = URL(string: name)?.lastPathComponent ?? name
        if self.loadImageFromDiskWith(fileName: name) != nil {
            completion(self.loadImageFromDiskWith(fileName: name))
        }
        
        // http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
        
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
    
    func fechMovi2(name: String, completion: @escaping(AboutModel?) -> ()) {
        
        var tasks = [AboutModelLoad]()
        db.collection("About").getDocuments() { [weak self] (querySnapshot, err) in
            
            guard let self = self else { return }
               if let err = err {
                   print("Error getting documents: \(err)")
                   completion(nil)
               } else {
                    for document in querySnapshot!.documents {
                  let item = AboutModelLoad(snapshot: document)
                        tasks.append(item)
                   }
                self.load(tasks.first!.videoDescription) { (url) in
                    if let url = url {
                        let model = AboutModel(video: url, title: tasks.first!.title, text: tasks.first!.description)
                        completion(model)
                    } else {
                        completion(nil)
                    }
                }
               }
           }
    }
    
    private func load(_ resource: String, result: @escaping ((URL?) -> Void)) {
        
        let fileName = URL(string: resource)?.lastPathComponent ?? resource
        if self.loadImageFromDiskWith(fileName: fileName) != nil {
            result(self.loadImageFromDiskWith(fileName: fileName))
        }
        
        let url = URL(string: resource)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("\(error?.localizedDescription)")
            } else {
                guard let data = data else {
                    result(nil)
                    return
                }
                
                let fileManager = FileManager.default
                let documentDir = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let localFile = documentDir.appendingPathComponent(fileName)
                
                do {
                    try data.write(to: localFile)
                    print("\(localFile)")
                    result(self.loadImageFromDiskWith(fileName: fileName))
                } catch let error {
                    print("error saving file with error", error)
                }
                
  //              result(UIImage(data: data))
            }
        }
        task.resume()
    }
   
    
    private func loadImageFromDiskWith(fileName: String) -> URL? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        guard let dirPath = paths.first else { return nil }
        
        if FileManager.default.fileExists(atPath: dirPath.appending("/\(fileName)")) {
            return URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
        }
        
        return nil
        
//        if let dirPath = paths.first {
//            let videoUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
//
//            videoUrl.path
//
//            print("\(videoUrl)")
//            return videoUrl
//
//        }

//        return nil
    }
}



