//
//  LastImageTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class LastImageTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
    
    private var lastImage: UIImageView = {
        let im = UIImageView()
        im.backgroundColor = .red
        im.contentMode = .scaleToFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        lb.backgroundColor = .clear
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var darkView: UIView = {
        let imView = UIView()
        imView.backgroundColor = .orange
        imView.contentMode = .center
        imView.layer.masksToBounds = true
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           self.contentView.backgroundColor = .clear
           self.createConstraint()
       }
     
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func configure(_ image: Data) {
        self.lastImage.image = UIImage(data: image)
    }

}

extension LastImageTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(lastImage)
        
        NSLayoutConstraint.activate([
            lastImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lastImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lastImage.topAnchor.constraint(equalTo: self.topAnchor),
            lastImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        lastImage.addSubview(darkView)
        
        NSLayoutConstraint.activate([
            darkView.trailingAnchor.constraint(equalTo: lastImage.trailingAnchor),
            darkView.leadingAnchor.constraint(equalTo: lastImage.leadingAnchor),
            darkView.topAnchor.constraint(equalTo: lastImage.topAnchor),
            darkView.bottomAnchor.constraint(equalTo: lastImage.bottomAnchor)
        ])
        
        darkView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: darkView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: darkView.centerXAnchor)
            
        ])
    }
}

