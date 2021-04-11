//
//  ContactsViewController.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var presenter: ContactsModulePresenterProtocol!
    var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black

        self.createTable()
    }
    

}

extension ContactsViewController {
    func createTable() {
        self.table = UITableView()
        self.view.addSubview(self.table)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseId)
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
        table.topAnchor.constraint(equalTo: self.view.topAnchor),
        table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.table.dataSource = self
        self.table.delegate = self
    }
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        header.backgroundView?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont.systemFont(ofSize: 30)
        
    }
}

extension ContactsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.countSectin
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.presenter.contacts()[section].titl
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.countRowInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.reuseId, for: indexPath) as! ContactTableViewCell
        
        cell.configure(self.presenter.contacts()[indexPath.section].contact)
//        cell.backgroundColor = .blue
        return cell
    }
    
    
}

extension ContactsViewController: ContactsModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
