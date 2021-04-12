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
            lb.textAlignment = .center
            lb.font = UIFont.systemFont(ofSize: 17)
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
        stackV.spacing = 20.0
        return stackV
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupConstraints()
        
        self.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }
        
        func configure(_ logo: String) {
          
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
        
        stacView.addArrangedSubview(categoryImageView)
        stacView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

