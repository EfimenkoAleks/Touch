//
//  APIServiceServices.swift
//  TouchIt
//
//  Created by Trainee Alex on 15.04.2021.
//


import Foundation
import FirebaseStorage
import FirebaseFirestore

protocol APIServiceServicesProtocol {
    func fechService(completion: @escaping ([ServiceCategory]?) -> ())
}

enum Collection {
    case about, contacts, projects, services
}

class APIServiceServicesImplementation {
    let db = Firestore.firestore()
}

extension APIServiceServicesImplementation: APIServiceServicesProtocol {
    
    func fechService(completion: @escaping ([ServiceCategory]?) -> ()) {
        
        var tasks = [ServiceCategory]()
        db.collection("Services").getDocuments() { (querySnapshot, err) in
               if let err = err {
                   print("Error getting documents: \(err)")
                   completion(nil)
               } else {
             
                    for document in querySnapshot!.documents{

                  let item = ServiceCategory(snapshot: document)
                        tasks.append(item)
                   }
                   completion(tasks)
               }
           }
    }
    
//    func fechProject(completion: @escaping ([ProjectMod]?) -> ()) {
//
//        var tasks = [ProjectMod]()
//        db.collection("Projects").getDocuments() { (querySnapshot, err) in
//               if let err = err {
//                   print("Error getting documents: \(err)")
//                   completion(nil)
//               } else {
//
//                    for document in querySnapshot!.documents{
//
//                  let item = ProjectMod(snapshot: document)
//                        tasks.append(item)
//
//
//                   }
//                   completion(tasks)
//
//               }
//           }
//    }
    
    
//    func fechPhoto(completion: @escaping (URL?) -> ()) {
//
//        let name = "placeholder3.png"
//
//        let fileName = URL(string: name)?.lastPathComponent ?? name
//        if self.loadImageFromDiskWith(fileName: name) != nil {
//            completion(self.loadImageFromDiskWith(fileName: name))
//        }
//
//  //      let storageRef = Storage.storage().reference(withPath: "projects/ios/ProjectOne/placeholder.png")
//        let storageRef = Storage.storage().reference(withPath: "projects/ios/ProjectTen/placeholder1.png")
//        storageRef.getData(maxSize: Int64.max) { (data, error) in
//
//            if error != nil {
//                completion(nil)
//            } else {
//                print("\(String(describing: data))")
//                guard let data = data else { return }
//
//                let fileManager = FileManager.default
//                let documentDir = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                let localFile = documentDir.appendingPathComponent(fileName)
//
//                //Checks if file exists, removes it if so.
//                if FileManager.default.fileExists(atPath: localFile.path) {
//                    do {
//                        try FileManager.default.removeItem(atPath: localFile.path)
//                        print("Removed old image")
//                    } catch let removeError {
//                        print("couldn't remove file at path", removeError)
//                    }
//                }
//                do {
//                    try data.write(to: localFile)
//                    print("\(localFile)")
//                    completion(self.loadImageFromDiskWith(fileName: name))
//                } catch let error {
//                    print("error saving file with error", error)
//                }
//            }
//
//
//
//
//        }
//
//
//    }
    
    private func loadImageFromDiskWith(fileName: String) -> URL? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
        

//            videoUrl.path

            return imageUrl

        }

        return nil
    }
    
    
    
}
