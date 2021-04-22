//
//  MainImageTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class MainImageTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
 //   private var heightContraint: NSLayoutConstraint?
    private var curHeight: CGFloat = 230
    
    
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
    
    func configure(_ image: Data, _ height: CGFloat) {
      
        self.mainImage.image = UIImage(data: image)
        self.curHeight = height
        
//            let imWidth = imag?.size.width
//            let imHeight = imag?.size.height
//            let ratio = imHeight! / imWidth!
//        self.heightContraint?.constant = width * ratio
//            self.layoutIfNeeded()
    }

}

extension MainImageTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(mainImage)
        
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: curHeight)
        ])
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: mainImage.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor)
        ])
    }
}
