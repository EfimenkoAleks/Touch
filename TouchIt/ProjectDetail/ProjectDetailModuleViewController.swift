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
        self.castomBarBeckButton()
   
        self.presenter.fetchProject()
    }
}

extension ProjectDetailViewController {
    private func createTable() {
    
        tableView = UITableView()
            
            tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
            tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainImageTableViewCell.self, forCellReuseIdentifier: MainImageTableViewCell.reuseId)
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseId)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseId)
        tableView.register(MoreImagesTableViewCell.self, forCellReuseIdentifier: MoreImagesTableViewCell.reuseId)
        tableView.register(LastImageTableViewCell.self, forCellReuseIdentifier: LastImageTableViewCell.reuseId)
        tableView.register(ImagesTableViewCell.self, forCellReuseIdentifier: ImagesTableViewCell.reuseId)
            tableView.isScrollEnabled = true
   //         tableView.rowHeight = UITableView.automaticDimension
  //          tableView.estimatedRowHeight = 300.0
            tableView.showsVerticalScrollIndicator = false
          
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let fooretView = CustomFooterView(height: 200, width: self.view.frame.width)
        fooretView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fooretView)
        
        NSLayoutConstraint.activate([
            fooretView.heightAnchor.constraint(equalToConstant: 100),
            fooretView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            fooretView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            fooretView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func castomBarBeckButton() {
        self.navigationController?.navigationBar.tintColor = .white
        }
}

extension ProjectDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.countElements
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let item = self.presenter.curentModel(by: indexPath.section)
        
        switch item {
        case .mainImage(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: MainImageTableViewCell.reuseId, for: indexPath) as! MainImageTableViewCell
            cell.configure(data,300)
            return cell
        case .title(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseId, for: indexPath) as! TitleTableViewCell
            cell.configure(title)
            return cell
        case .description(let descr):
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseId, for: indexPath) as! DescriptionTableViewCell
            cell.configure(descr)
            return cell
        case .moreImage(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagesTableViewCell.reuseId, for: indexPath) as! ImagesTableViewCell
            cell.delegate = self
            cell.configure(with: data)
            return cell
        case .lastImage(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: LastImageTableViewCell.reuseId, for: indexPath) as! LastImageTableViewCell
            cell.configure(data)
            return cell
        }
    }
}

extension ProjectDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItemAt(index: indexPath)
        print("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Set the spacing between sections
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 20
       }
       
       // Make the background color show through
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
}

extension ProjectDetailViewController: ImagesTableViewCellDelegate {
    func imagesTableViewCell(_ cell: UITableViewCell, didSelectImageAt index: Int) {
        guard let section = tableView.indexPath(for: cell)?.section else { return }
        presenter.didSelectItemAt(index: IndexPath(item: index, section: section))
    }
}

extension ProjectDetailViewController: ProjectDetailModuleViewProtocol {
    func updateView() {
        self.tableView.reloadData()
    }
    
    func restoreContentOffset() {
        tableView.setContentOffset(.zero, animated: true)
    }
}
