//
//  ContentMainView.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

//import UIKit
//
//class ContentMainView: UIView {
//
//    lazy var collection = createCollection()
//
//    var segment: UISegmentedControl = {
//        let items = ["About", "Services", "Projects", "Contacts"]
//        let customSC = UISegmentedControl(items: items)
//        customSC.selectedSegmentIndex = 0
//        // Set up Frame and SegmentedControl
//        let frame = UIScreen.main.bounds
//        customSC.frame = CGRect(x: frame.minX + 16, y: frame.minY + 88,
//                                width: frame.width - 32, height: frame.height*0.04)
//        // Style the Segmented Control
//        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
//        customSC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
//        customSC.tintColor = .brown
//        customSC.selectedSegmentTintColor = #colorLiteral(red: 0.9608978426, green: 0.912968934, blue: 0.8459051666, alpha: 1)
//        customSC.layer.borderWidth = 1
//
//        // Add target action method
//        customSC.addTarget(self, action: #selector(ContentMainView.forSegment), for: .valueChanged)
//        return customSC
//    }()
//
//    override init(frame: CGRect) {
//            super.init(frame: frame)
//
//        addSubview(self.segment)
//        addSubview(collection)
//        createConstraints()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//    @objc private func forSegment(sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            break
//        case 1:
//            break
//        case 2:
//            break
//        default:
//            break
//        }
//    }
//}
//
//extension ContentMainView {
//    private func createCollection() -> UICollectionView {
//        var collectionView: UICollectionView
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: 400, height: 600)
//        layout.scrollDirection = .horizontal
//
//        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
//        collectionView.register(AboutCell.self, forCellWithReuseIdentifier: AboutCell.reuseId)
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isScrollEnabled = true
//        collectionView.isUserInteractionEnabled = true
//        collectionView.backgroundColor = .green
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }
//
//    private func createConstraints() {
//        NSLayoutConstraint.activate([
//            collection.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 10),
//            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collection.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//}
