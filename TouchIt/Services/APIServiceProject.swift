//
//  APIServiceProject.swift
//  TouchIt
//
//  Created by Trainee Alex on 15.04.2021.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseFirestore

protocol APIProjectProtocol {
    func fechProject(completion: @escaping ([ProjectModWithImage]?) -> ())
}

class APIProjectImplementation {
    let db = Firestore.firestore()
}

extension APIProjectImplementation: APIProjectProtocol {
    
    func fechProject(completion: @escaping ([ProjectModWithImage]?) -> ()) {
        
//        let group = DispatchGroup()
        
        var tasks = [ProjectModWithImage]()
        db.collection("Projects").getDocuments() { (querySnapshot, err) in
               if let err = err {
                   print("Error getting documents: \(err)")
                   completion(nil)
               } else {
             
                    for document in querySnapshot!.documents {

                  let item = ProjectMod(snapshot: document)
                        self.load(item.photoLibaryUrl.first ?? "") { (image) in
                            
                            let itemWithImage = ProjectModWithImage(description: item.description, mainImageUrl: image, name: item.name, type: item.type)
                            tasks.append(itemWithImage)
                            if tasks.count == querySnapshot!.documents.count {
                                completion(tasks)
                            }
                        }
                   }
                
//                group.notify(queue: DispatchQueue.global()) {
//                    completion(tasks)
//                  }
               }
           }
    }
    
    private func load(_ resource: String, result: @escaping ((UIImage?) -> Void)) {
        
        let fileName = URL(string: resource)?.lastPathComponent ?? resource
        if self.loadImageFromDiskWith(fileName: fileName) != nil {
            result(self.loadImageFromDiskWith(fileName: fileName)!)
        }
        
        let url = URL(string: resource)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
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
    
    
    
    
    private func loadImageFromDiskWith(fileName: String) -> UIImage? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let filename = URL(string: fileName)?.lastPathComponent ?? fileName
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(filename)
            let image = UIImage(contentsOfFile: imageUrl.path)
//            print("\(String(describing: image))")
            return image

        }

        return nil
    }
}
