//
//  MainViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainModulePresenterProtocol!
    var contentMainView: ContentMainView!
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
       
        self.createMainView()

        // Do any additional setup after loading the view.
    }
   
}

extension MainViewController {
    
    private func createMainView() {
        
        self.contentMainView = ContentMainView()
        self.view.addSubview(contentMainView)
        
        contentMainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        contentMainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        contentMainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentMainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.contentMainView.collection.dataSource = self
        self.contentMainView.collection.delegate = self
    }
}

extension MainViewController: MainModuleViewProtocol {
    
    func updateView() {
        
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutCell.reuseId, for: indexPath) as! AboutCell
        
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
}
