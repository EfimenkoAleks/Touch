//
//  ContactsViewController.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var presenter: ContactsModulePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed

        // Do any additional setup after loading the view.
    }
    

}

extension ContactsViewController: ContactsModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
