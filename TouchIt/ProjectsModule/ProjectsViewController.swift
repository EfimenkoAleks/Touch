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
        self.createNavigation()
        self.createSearchController()
        self.presenter.fetchProject()
    }
}

extension ProjectsViewController {
    
    private func createSearchController() {
        // Setup the Seatch Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func createNavigation() {
        let navigationBarAppearance = self.navigationController!.navigationBar
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .compact)

    }
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        var height = self.view.frame.height / 6
        let width = (self.view.frame.width / 2) - 2
        let aspectRatio: CGFloat = 0.75 //9 / 12
        height = width * aspectRatio
        
        layout.itemSize = CGSize(width: width, height: height)
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
            self.collection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.collection.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4 * 3)
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
        searchController.whiteColorText()
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

extension UISearchController {
    func whiteColorText() {
        self.searchBar.searchTextField.attributedText = NSAttributedString(string: searchBar.text!, attributes: [.foregroundColor: UIColor.white])
    }
}
