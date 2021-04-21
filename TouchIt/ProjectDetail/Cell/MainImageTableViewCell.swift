//
//  MainImageTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class MainImageTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
    
    private var mainImage: UIImageView = {
        let im = UIImageView()
        im.backgroundColor = .red
        im.contentMode = .scaleToFill
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
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
        self.mainImage.image = UIImage(data: image)
    }

}

extension MainImageTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(mainImage)
        
        NSLayoutConstraint.activate([
            mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
