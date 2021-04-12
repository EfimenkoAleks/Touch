//
//  ServiceCategoryViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ServiceCategoryViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ServiceCategoryModulePresenter!
    var collection: UICollectionView!
    
    var imView: UIImageView = {
        let imView = UIImageView()
        imView.backgroundColor = .orange
        imView.contentMode = .center
        imView.layer.masksToBounds = true
        imView.layer.cornerRadius = 20
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()
    
    var contentView: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .green
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 30, weight: .thin)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var textLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var textView: UITextView = {
        let sc = UITextView()
        sc.backgroundColor = .clear
        sc.alwaysBounceVertical = true
        
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemRed
        self.setupConstraints()
        self.createCollection()
    }

}

extension ServiceCategoryViewController {
    
    private func setupConstraints() {

        self.view.addSubview(contentView)

        NSLayoutConstraint.activate([
        contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 4),
        contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4),
        contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        contentView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3 * 2)
        ])

        contentView.addSubview(imView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)

        NSLayoutConstraint.activate([
            imView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3.5),
            imView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: self.view.frame.height / 20),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        textView.delegate = self

        textLabel.text = "Enter some text..."
        textView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width / 3, height: 200)
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ServiceCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCategoryCollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = true
        self.collection.isUserInteractionEnabled = true
        self.collection.backgroundColor = .systemTeal
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collection)
        
        NSLayoutConstraint.activate([
            self.collection.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.collection.dataSource = self
    }
}

extension ServiceCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCategoryCollectionViewCell.reuseId, for: indexPath) as! ServiceCategoryCollectionViewCell
        
        
        return cell
    }
    
    
}

extension ServiceCategoryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
  //          textLabel.isHidden = !textView.text.isEmpty
        }
}

// MARK: - Extensions -

extension ServiceCategoryViewController: ServiceCategoryModuleView {
}
