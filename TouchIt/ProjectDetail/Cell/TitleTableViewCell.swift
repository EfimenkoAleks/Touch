//
//  TitleTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
    
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
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
        self.titleLabel.text = text
    }

}

extension TitleTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
