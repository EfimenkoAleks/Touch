//
//  AboutEntity.swift
//  TouchIt
//
//  Created by Trainee Alex on 09.04.2021.
//

import Foundation
import FirebaseFirestore
import Firebase

struct AboutModel {
    var video: URL?
    var title: String
    var text: String
}

struct AboutModelLoad {
    var description: String
    var videoDescription: String
    var title: String
   
    
    var dictionary : [String:Any] {
        return [
            "description": description  ,
            "videoDescription": videoDescription
        ]
    }
    
    init(snapshot: QueryDocumentSnapshot) {
        
        let snapshotValue = snapshot.data()
        description = snapshotValue["description"] as! String
        videoDescription = snapshotValue["videoDescription"] as! String
       title = "About"
     }
}
