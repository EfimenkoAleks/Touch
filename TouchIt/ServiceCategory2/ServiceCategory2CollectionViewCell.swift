//
//  ServiceCategory2CollectionViewCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 14.04.2021.
//

import UIKit

class ServiceCategory2CollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "ServiceCategory2CollectionViewCell"
    
    var contentImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .clear
            imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
            return imageView
        }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentImageView.layer.cornerRadius = 14
        contentImageView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()
        self.backgroundColor = .clear
        }
        
        func configure(_ imageData: Data?) {
            guard let image = imageData else { return }
            contentImageView.image = UIImage(data: image)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ServiceCategory2CollectionViewCell {
    private func setupConstraints() {
        self.contentView.addSubview(contentImageView)
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: self.topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

