//
//  MoreImagesTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class MoreImagesTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MoreImagesTableViewCell"
    
    private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var fourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var fiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var verticalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.vertical
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
            stackV.spacing = 8.0
            return stackV
        }()
    
    private var litleVerticalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.vertical
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
            stackV.spacing = 8.0
            return stackV
        }()
    
    private var horizontalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.horizontal
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
            stackV.spacing = 8.0
            return stackV
        }()
    
    private var litleHorizontalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.horizontal
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
            stackV.spacing = 8.0
            return stackV
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
           self.contentView.backgroundColor = .black
           self.createConstraint()
       }
     
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func configure(_ image: [Data]) {
        if image.count > 0 {
        mainImageView.image = UIImage(data: image[0])
        firstImageView.image = UIImage(data: image[1])
        secondImageView.image = UIImage(data: image[2])
        thirdImageView.image = UIImage(data: image[3])
        fourImageView.image = UIImage(data: image[4])
        fiveImageView.image = UIImage(data: image[5])
        } else {
            mainImageView.image = UIImage(systemName: "folder")
            firstImageView.image = UIImage(systemName: "folder")
            secondImageView.image = UIImage(systemName: "folder")
            thirdImageView.image = UIImage(systemName: "folder")
            fourImageView.image = UIImage(systemName: "folder")
            fiveImageView.image = UIImage(systemName: "folder")
        }
    }

}

extension MoreImagesTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(verticalStackView)
       
        NSLayoutConstraint.activate([
            verticalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
//            verticalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            verticalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor)
        ])
        
        verticalStackView.addArrangedSubview(litleHorizontalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        litleHorizontalStackView.addArrangedSubview(firstImageView)
        litleHorizontalStackView.addArrangedSubview(secondImageView)
        litleHorizontalStackView.addArrangedSubview(thirdImageView)
        
        NSLayoutConstraint.activate([
            firstImageView.widthAnchor.constraint(equalToConstant: self.frame.width / 3 * 1.25),
            firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor),
            secondImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            secondImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor),
            thirdImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            thirdImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        ])
        
        horizontalStackView.addArrangedSubview(mainImageView)
        horizontalStackView.addArrangedSubview(litleVerticalStackView)
        
        NSLayoutConstraint.activate([
            mainImageView.widthAnchor.constraint(equalToConstant: self.frame.width / 3 * 2.56),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor),
            secondImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            secondImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        ])
        
        litleVerticalStackView.addArrangedSubview(fourImageView)
        litleVerticalStackView.addArrangedSubview(fiveImageView)
        
        NSLayoutConstraint.activate([
            fourImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            fourImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor),
            fiveImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            fiveImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        ])
    }
}

