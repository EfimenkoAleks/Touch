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
    private var filterItems: [ProjectModel] = []
    
    private var searchBarIsEmpty: Bool {
            guard let text = searchController.searchBar.text else { return false }
            return text.isEmpty
        }
    
        private var isFiltering: Bool {
            return searchController.isActive && !searchBarIsEmpty
        }
        
        private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black

        self.createCollection()
        
        // Setup the Seatch Controller
                   searchController.searchResultsUpdater = self
                   searchController.obscuresBackgroundDuringPresentation = false
                   searchController.searchBar.placeholder = "Search"
        
        searchController.searchBar.tintColor = .systemBlue
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.barTintColor = .white
                   navigationItem.searchController = searchController
                   definesPresentationContext = true
    }
    
    
   

}

extension ProjectsViewController {
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (self.view.frame.width / 2) - 6, height: self.view.frame.height / 6)
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: ProjectCollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = false
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
    }
}

extension ProjectsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.countItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCollectionViewCell.reuseId, for: indexPath) as! ProjectCollectionViewCell
        
        cell.configure(self.presenter.itemForindex(index: indexPath.item))
        return cell
    }
    
    
}

extension ProjectsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        self.filterItems = self.presenter.itemsForFilter.filter({ (item: ProjectModel) -> Bool in
            return item.icon.lowercased().contains(searchText.lowercased())
        })
    //    collectionView?.reloadData()
    }
}

extension ProjectsViewController: ProjectsModuleViewProtocol {
    func updateView() {
        
    }
    
    
}
