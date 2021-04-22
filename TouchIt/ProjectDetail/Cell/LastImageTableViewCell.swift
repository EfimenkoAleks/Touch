//
//  LastImageTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class LastImageTableViewCell: UITableViewCell {
    
    static var reuseId: String = "LastImageTableViewCell"
 //   private var heightContraint: NSLayoutConstraint?
    private var height: CGFloat = 200
    
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
        lb.font = UIFont.systemFont(ofSize: 40, weight: .light)
        lb.backgroundColor = .clear
        lb.text = "NEXT PROJECT"
        lb.textColor = .white
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var darkView: UIView = {
        let imView = UIView()
        imView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.8)
        imView.contentMode = .center
        imView.layer.masksToBounds = true
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           self.contentView.backgroundColor = .red
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
            lastImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            lastImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            lastImage.heightAnchor.constraint(equalToConstant: height)
        ])
//
//        heightContraint = lastImage.heightAnchor.constraint(equalToConstant: 0)
//        self.addConstraint(heightContraint!)
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: lastImage.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: lastImage.bottomAnchor)
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

