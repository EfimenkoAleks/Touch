//
//  ProjectCollectionViewCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 09.04.2021.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
        static var reuseId: String = "ProjectCollectionViewCell"
        
        var itemImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.backgroundColor = .clear
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleToFill
            imageView.layer.masksToBounds = true
                return imageView
            }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()

        self.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        }
        
        func configure(_ logo: ProjectModel) {
            itemImageView.image = UIImage(named: logo.icon)
            itemImageView.layer.cornerRadius = 16
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ProjectCollectionViewCell {
    
    private func setupConstraints() {
        self.contentView.addSubview(itemImageView)
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
