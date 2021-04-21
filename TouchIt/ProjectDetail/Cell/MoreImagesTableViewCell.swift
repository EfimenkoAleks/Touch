//
//  MoreImagesTableViewCell.swift
//  TouchIt
//
//  Created by user on 21.04.2021.
//

import UIKit

class MoreImagesTableViewCell: UITableViewCell {
    
    static var reuseId: String = "MainImageTableViewCell"
    
    private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var fourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var fiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var verticalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.vertical
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
 //           stackV.spacing = 8.0
            return stackV
        }()
    
    private var litleVerticalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.vertical
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
//            stackV.spacing = 8.0
            return stackV
        }()
    
    private var horizontalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.horizontal
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
 //           stackV.spacing = 8.0
            return stackV
        }()
    
    private var litleHorizontalStackView: UIStackView = {
            let stackV   = UIStackView()
            stackV.axis  = NSLayoutConstraint.Axis.horizontal
            stackV.distribution  = UIStackView.Distribution.equalSpacing
            stackV.alignment = UIStackView.Alignment.center
            stackV.backgroundColor = .clear
            stackV.translatesAutoresizingMaskIntoConstraints = false
//            stackV.spacing = 8.0
            return stackV
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
        
    }

}

extension MoreImagesTableViewCell {
    private func createConstraint() {
        
        self.contentView.addSubview(verticalStackView)
       
        NSLayoutConstraint.activate([
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        verticalStackView.addArrangedSubview(litleHorizontalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        litleHorizontalStackView.addArrangedSubview(firstImageView)
        litleHorizontalStackView.addArrangedSubview(secondImageView)
        litleHorizontalStackView.addArrangedSubview(thirdImageView)
        
        NSLayoutConstraint.activate([
            firstImageView.widthAnchor.constraint(equalToConstant: (self.frame.width / 3) - 2),
            firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor),
            secondImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            secondImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor),
            thirdImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor),
            thirdImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        ])
        
        horizontalStackView.addArrangedSubview(mainImageView)
        horizontalStackView.addArrangedSubview(litleVerticalStackView)
        
        NSLayoutConstraint.activate([
            mainImageView.widthAnchor.constraint(equalToConstant: firstImageView.frame.width * 2 + 3),
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

