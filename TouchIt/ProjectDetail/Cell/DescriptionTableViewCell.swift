//
//  DescriptionTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
    
    private var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           self.contentView.backgroundColor = .clear
           self.createConstraint()
       }
     
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func configure(_ text: String) {
        self.descriptLabel.text = text
    }

}

extension DescriptionTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(descriptLabel)
        
        NSLayoutConstraint.activate([
            descriptLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: descriptLabel.topAnchor),
            self.bottomAnchor.constraint(equalTo: descriptLabel.bottomAnchor)
        ])
    }
}

