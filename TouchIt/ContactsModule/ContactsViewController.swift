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
        
        table.sectionHeaderHeight = 60
        table.sectionFooterHeight = 0.5
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseId)
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
        table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25),
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
        return 56
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        let header = view as! UITableViewHeaderFooterView
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont.systemFont(ofSize: 35)

    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
//        view1.tintColor = .white
//        let labName = UILabel()
//        labName.text = "Shane Murpy"
//        view1.addSubview(labName)
//
//        return view1
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view1 = UIView(frame: CGRect(x: 10, y: 0, width: self.view.frame.width - 20, height: 1))
        view1.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        return view1
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
        
        let item = self.presenter.contacts()[indexPath.section]
        
        switch item.contact[indexPath.row] {
        case .place( let place):
            cell.configure(text: place, icon: UIImage(named: "place")!)
            cell.buttonPhone.isHidden = true
        case .phone( let phone):
            cell.configure(text: phone, icon: UIImage(named: "phone")!)
            cell.delegate = self
        case .mail( let mail):
            cell.configure(text: mail, icon: UIImage(named: "mail")!)
            cell.buttonPhone.isHidden = true
        }
        
        return cell
    }
}

extension ContactsViewController: ContactsModuleViewProtocol {
    func updateView() {
        
    }
}

extension ContactsViewController: PressButtonPhoneDelegate {
    func pressPhone(phone: String) {
        guard let phoneNumber = phone.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
//        UIApplication.shared.open(url)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
