//
//  ServiceCategoryHeaderCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 20.04.2021.
//

import UIKit

class ServiceCategoryHeaderCell: UICollectionReusableView {
    
    static var reuseId: String = "ServiceCategoryHeaderCell"
    
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        self.addConstraints()
    }
    
    func configureCell(_ text: String) {
        self.titleLabel.text = text
    }
    
    private func addConstraints() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
