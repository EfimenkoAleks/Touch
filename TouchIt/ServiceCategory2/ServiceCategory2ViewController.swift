//
//  ServiceCategory2ViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ServiceCategory2ViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ServiceCategory2ModulePresenter!
    private var collection: UICollectionView!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.createCollection()
        
        self.presenter.getPhoto()
    }
}

// MARK: - Extensions -

extension ServiceCategory2ViewController {
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (self.view.frame.width / 2) - 2, height: self.view.frame.height / 6)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ServiceCategory2CollectionViewCell.self, forCellWithReuseIdentifier: ServiceCategory2CollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = true
        self.collection.isUserInteractionEnabled = true
        self.collection.backgroundColor = .black
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collection)
        
        NSLayoutConstraint.activate([
            self.collection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 18),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.collection.dataSource = self
        self.collection.delegate = self
    }
}

extension ServiceCategory2ViewController: UICollectionViewDelegate {
    
}

extension ServiceCategory2ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.countItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: ServiceCategory2CollectionViewCell.reuseId, for: indexPath) as! ServiceCategory2CollectionViewCell
        
        cell.configure(self.presenter.curentItem(index: indexPath.item))
        return cell
    }
    
    
}

extension ServiceCategory2ViewController: ServiceCategory2ModuleView {
    func updateView() {
        self.collection.reloadData()
    }
}
