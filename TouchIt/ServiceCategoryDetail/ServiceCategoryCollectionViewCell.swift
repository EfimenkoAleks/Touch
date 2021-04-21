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
        imageView.contentMode = .scaleToFill
            return imageView
        }()
    
    var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        lb.text = "ddddfsfsff"
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var stackView: UIStackView = {
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
        
        self.backgroundColor = .clear
 //       self.layer.cornerRadius = 20
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        categoryImageView.layer.cornerRadius = 14
        categoryImageView.clipsToBounds = true
    }
        
    func configure(_ logo: ProjectModWithImage, title: String) {
            titleLabel.text = title
        categoryImageView.image = UIImage(data: logo.mainImageUrl!)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ServiceCategoryCollectionViewCell {
    private func setupConstraints() {
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
//            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
       
        NSLayoutConstraint.activate([
 //           categoryImageView.topAnchor.constraint(equalTo: self.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
 //           categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: self.bounds.height / 5 * 3.8)
        ])
    }
}

