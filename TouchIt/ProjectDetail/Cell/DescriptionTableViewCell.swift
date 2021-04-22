//
//  DescriptionTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static var reuseId: String = "DescriptionTableViewCell"
    
    private var descriptLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           self.contentView.backgroundColor = .black
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
            descriptLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            descriptLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: descriptLabel.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: descriptLabel.bottomAnchor)
        ])
    }
}

