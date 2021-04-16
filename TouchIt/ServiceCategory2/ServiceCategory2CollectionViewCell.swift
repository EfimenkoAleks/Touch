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
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()
        
        self.layer.cornerRadius = 12
        self.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        
        func configure(_ imageUrl: UIImage?) {
            guard let image = imageUrl else { return }
            contentImageView.image = image
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ServiceCategory2CollectionViewCell {
    private func setupConstraints() {
        self.contentView.addSubview(contentImageView)
        
        NSLayoutConstraint.activate([
            contentImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentImageView.widthAnchor.constraint(equalToConstant: 80),
            contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor)
        ])
    }
}

