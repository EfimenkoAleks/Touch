//
//  AppDelegate.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import UIKit
import Firebase
import FirebaseStorage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let module = MainWireFrame.create()
 //       let navigation = UINavigationController(rootViewController: module)
        self.window?.rootViewController = module //navigation
        self.window?.makeKeyAndVisible()
        
        
        
 //       let storageRef = Storage.storage().reference().child("lock.png")
        
        
       

        // Override point for customization after application launch.
        return true
    }
}

