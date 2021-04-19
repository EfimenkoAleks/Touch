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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var imView: UIImageView = {
        let imView = UIImageView()
        imView.backgroundColor = .clear
        imView.contentMode = .scaleToFill
 //       imView.layer.masksToBounds = true
 //       imView.layer.cornerRadius = 20
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()
    
    var contentView: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .clear
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    var imageContentView: UIView = {
        let view1 = UIView()
        view1.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        view1.layer.cornerRadius = 15
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 35, weight: .light)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var textView: UITextView = {
        let sc = UITextView()
        sc.backgroundColor = .clear
        sc.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        sc.alwaysBounceVertical = true
        sc.isScrollEnabled = false
        sc.textColor = .white
        sc.isEditable = false
        sc.isSelectable = false
        
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.setupConstraints()
        self.createCollection()
        self.castomBarBeckButton()
        
        self.presenter.fetch()
    }

}

extension ServiceCategoryViewController {
    
    private func setupConstraints() {

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 25)
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        contentView.addSubview(imageContentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)

        NSLayoutConstraint.activate([
            imageContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContentView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3.8),
  //          imageContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        imageContentView.addSubview(imView)

        NSLayoutConstraint.activate([
            imView.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            imView.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
            imView.heightAnchor.constraint(equalToConstant: 90),
            imView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: 35),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: self.view.frame.height / 20),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
        textView.delegate = self
    }
    
    private func createCollection() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width / 5 * 2.6, height: self.view.frame.height / 5)
        layout.scrollDirection = .horizontal
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collection.register(ServiceCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCategoryCollectionViewCell.reuseId)
        self.collection.showsHorizontalScrollIndicator = false
        self.collection.isScrollEnabled = true
        self.collection.isUserInteractionEnabled = true
        self.collection.backgroundColor = .clear
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(self.collection)
        
        NSLayoutConstraint.activate([
            self.collection.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 30),
            self.collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.collection.heightAnchor.constraint(equalToConstant: layout.itemSize.height)
        ])
        
        self.collection.dataSource = self
        self.collection.delegate = self
    }
    
    func castomBarBeckButton() {
        self.navigationController?.navigationBar.tintColor = .white
        }
}

extension ServiceCategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.goToNextController(index: indexPath.item)
    }
}

extension ServiceCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.countItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCategoryCollectionViewCell.reuseId, for: indexPath) as! ServiceCategoryCollectionViewCell
        
        cell.configure(self.presenter.iconForIndex(index: indexPath.item))
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
    func updateView() {
        self.imView.image = UIImage(named: self.presenter.logoForMainImage)
        self.titleLabel.text = self.presenter.curentModel.name
        self.textView.text = self.presenter.curentModel.description
        
        self.collection.reloadData()
    }
}
