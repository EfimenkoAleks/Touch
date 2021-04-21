//
//  ProjectDetailViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    
    var presenter: ProjectDetailModulePresenterProtocol!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.createTable()
   
    }
}

extension ProjectDetailViewController {
    func createTable() {
    
        tableView = UITableView()
            
            tableView.separatorStyle = .none
            tableView.backgroundColor = UIColor.clear
            tableView.translatesAutoresizingMaskIntoConstraints = false
//            tableView.register(UINib(nibName: "CellTitleXib", bundle: nil), forCellReuseIdentifier: CellTitleXibView.reuseId)
            
            tableView.isScrollEnabled = true
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 44.0
            tableView.showsVerticalScrollIndicator = false
          
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ProjectDetailViewController: ProjectDetailModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
