//
//  ServiceCategoryEntity.swift
//  TouchIt
//
//  Created by Trainee Alex on 13.04.2021.
//

import Foundation
import FirebaseFirestore
import Firebase

struct ServiceCategotiEntity {
    var title: String
    var icon: String
}

struct ModelForServiceCat {
    var service: [ServiceCategory]
    var project: [ProjectModWithImage]
}

struct ServiceCategory {
    var description: String
    var name: String
    var priority: Int
    var type: String
    
    var dictionary : [String:Any] {
        return [
            "description": description  ,
            "name": name  ,
            "priority": priority  ,
            "type": type
        ]
    }
    
    init(snapshot: QueryDocumentSnapshot) {
        
        let snapshotValue = snapshot.data()
        description = snapshotValue["description"] as! String
        name = snapshotValue["name"] as! String
        priority = snapshotValue["priority"] as! Int
        type = snapshotValue["type"] as! String
     }
}

