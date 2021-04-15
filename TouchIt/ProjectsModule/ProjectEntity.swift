//
//  ProjectEntity.swift
//  TouchIt
//
//  Created by Trainee Alex on 09.04.2021.
//

import Foundation
import FirebaseFirestore
import Firebase

struct ProjectModel {
    var icon: String
}

struct ProjectMod {
    var description: String
    var mainImageUrl: String
    var name: String
    var photoLibaryUrl: [String]
    var type: String
    
    var dictionary : [String:Any] {
        return [
            "description": description  ,
            "name": mainImageUrl  ,
            "priority": name  ,
            "photoLibaryUrl": photoLibaryUrl  ,
            "type": type
        ]
    }
    
    init(snapshot: QueryDocumentSnapshot) {
        
        let snapshotValue = snapshot.data()
        description = snapshotValue["description"] as! String
        mainImageUrl = snapshotValue["mainImageUrl"] as! String
        name = snapshotValue["name"] as! String
        photoLibaryUrl = snapshotValue["photoLibaryUrl"] as! [String]
        type = snapshotValue["type"] as! String
     }
}

struct ProjectModWithImage {
    var description: String
    var mainImageUrl: UIImage?
    var name: String
    var type: String
}

