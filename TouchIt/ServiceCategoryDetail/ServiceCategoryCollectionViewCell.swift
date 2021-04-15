//
//  ServiceCategoryCollectionViewCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 12.04.2021.
//

import UIKit

class ServiceCategoryCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "ServiceCategoryCollectionViewCell"
    
    var categoryImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .clear
            imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
    var titleLabel: UILabel = {
            let lb = UILabel()
            lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            lb.text = ""
        lb.textColor = .white
            lb.backgroundColor = .clear
            lb.numberOfLines = 0
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
    
    var stacView: UIStackView = {
        let stackV   = UIStackView()
        stackV.axis  = NSLayoutConstraint.Axis.vertical
        stackV.distribution  = UIStackView.Distribution.equalSpacing
        stackV.alignment = UIStackView.Alignment.center
        stackV.backgroundColor = .clear
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.spacing = 5.0
        return stackV
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()
        
        self.backgroundColor = .clear
        }
        
        func configure(_ logo: ServiceCategotiEntity) {
            categoryImageView.image = UIImage(named: logo.icon)
            titleLabel.text = logo.title
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ServiceCategoryCollectionViewCell {
    private func setupConstraints() {
        
        self.contentView.addSubview(stacView)
        
        NSLayoutConstraint.activate([
            stacView.topAnchor.constraint(equalTo: self.topAnchor),
            stacView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stacView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stacView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        stacView.addArrangedSubview(titleLabel)
        stacView.addArrangedSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: stacView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: stacView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            categoryImageView.leadingAnchor.constraint(equalTo:stacView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: stacView.trailingAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

