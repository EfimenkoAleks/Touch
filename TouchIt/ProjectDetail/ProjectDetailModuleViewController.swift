//
//  ProjectDetailViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    
    var presenter: ProjectDetailModulePresenterProtocol!
    private var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
 //       self.createCollection()
        
        // Setup the Seatch Controller
       
    }
}

extension ProjectDetailViewController: ProjectDetailModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
