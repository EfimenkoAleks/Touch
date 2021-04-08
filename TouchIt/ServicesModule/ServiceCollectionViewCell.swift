//
//  ServiceCollectionViewCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 08.04.2021.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "ServiceCollectionViewCell"
    
    var colorImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .clear
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
    var titleLabel: UILabel = {
            let lb = UILabel()
            lb.textAlignment = .center
            lb.font = UIFont.systemFont(ofSize: 17)
            lb.text = ""
        lb.textColor = .white
            lb.backgroundColor = .clear
            lb.numberOfLines = 0
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()
        
        self.layer.cornerRadius = 12
        self.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        }
        
        func configure(_ logo: Logo) {
            colorImageView.image = UIImage(named: logo.logoImage)
            titleLabel.text = logo.logeTitle
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ServiceCollectionViewCell {
    private func setupConstraints() {
        self.contentView.addSubview(colorImageView)
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
        colorImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        colorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            colorImageView.widthAnchor.constraint(equalToConstant: 80),
            colorImageView.heightAnchor.constraint(equalTo: colorImageView.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            
        ])
    }
}
