//
//  ProjectPageViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import UIKit

class ProjectPageViewController: UIViewController {
    
    var presenter: ProjectPageModulePresenterProtocol!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
       
    }
}

extension ProjectPageViewController: ProjectPageModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
