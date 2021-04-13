//
//  ServicesViewController.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import UIKit

class ServicesViewController: UIViewController {
    
    var presenter: ServicesModulePresenterProtocol!
    var collection: UICollectionView!
    weak var delegateMain: TransitionToNextDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.createCollection()
    
        // Do any additional setup after loading the view.
    }
}

extension ServicesViewController {
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (self.view.frame.width / 2) - 10, height: (self.view.frame.height / 4.4) - 10)
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = true
        self.collection.isUserInteractionEnabled = true
        self.collection.backgroundColor = .black
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collection)
        
        NSLayoutConstraint.activate([
            self.collection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 4),
            self.collection.heightAnchor.constraint(equalToConstant: self.view.frame.height / 5 * 4)
        ])
        
        self.collection.dataSource = self
        self.collection.delegate = self
    }
}

extension ServicesViewController: ServicesModuleViewProtocol {
    func updateView() {
        
    }

}

extension ServicesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.reuseId, for: indexPath) as! ServiceCollectionViewCell
        
        cell.configure(self.presenter.curentLogo(index: indexPath.item))
        
        return cell
    }

}

extension ServicesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.delegateMain?.goToNext(logo: self.presenter.curentLogo(index: indexPath.item))
    }
}
