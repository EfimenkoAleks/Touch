//
//  ProjectsViewController.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    var presenter: ProjectsModulePresenterProtocol!
    private var collection: UICollectionView!
    weak var delegateMain: TransitionProjectToNextDelegate?
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
            guard let text = searchController.searchBar.text else { return false }
            return text.isEmpty
        }
    private var isFiltering: Bool {
            return searchController.isActive && !searchBarIsEmpty
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.createCollection()
        
        // Setup the Seatch Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        
//        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
//            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
//
//            textField.attributedText = NSAttributedString(string: "textColor", attributes: [NSAttributedString.Key.foregroundColor: UIColor.yellow])
//
//        }
        searchController.searchBar.tintColor = .white
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.presenter.fetchProject()
    }
    
    
   

}

extension ProjectsViewController {
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (self.view.frame.width / 2) - 2, height: self.view.frame.height / 6)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: ProjectCollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = true
        self.collection.isUserInteractionEnabled = true
        self.collection.backgroundColor = .black
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collection)
        
        NSLayoutConstraint.activate([
  //          self.collection.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collection.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4 * 2.9)
        ])
        
        self.collection.dataSource = self
        self.collection.delegate = self
    }
}

extension ProjectsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var project: [ProjectModWithImage]
        
        if isFiltering {
//            project = self.presenter.itemForIndexFiltring(index: indexPath.item)
            project = self.presenter.itemFiltring()
        } else {
//            project = self.presenter.itemForindex(index: indexPath.item)
            project = self.presenter.itemNoFiltring()
        }
        self.delegateMain?.goToNext(model: project, index: indexPath.item)
    }
}

extension ProjectsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return self.presenter.countItemFiltred
            }
        return self.presenter.countItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCollectionViewCell.reuseId, for: indexPath) as! ProjectCollectionViewCell
        
        var project: ProjectModWithImage
        
        if isFiltering {
            project = self.presenter.itemForIndexFiltring(index: indexPath.item)
            cell.configure(project)
        } else {
            project = self.presenter.itemForindex(index: indexPath.item)
            cell.configure(project)
        }
        return cell
    }
    
    
}

extension ProjectsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.presenter.filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension ProjectsViewController: ProjectsModuleViewProtocol {
    func updateView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collection?.reloadData()
        }
    }
}
