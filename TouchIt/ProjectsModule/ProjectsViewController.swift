//
//  ProjectsViewController.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    var presenter: ProjectsModulePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal

        // Do any additional setup after loading the view.
    }
   

}

extension ProjectsViewController: ProjectsModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
