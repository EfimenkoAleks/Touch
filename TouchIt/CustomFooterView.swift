//
//  CustomFooterView.swift
//  TouchIt
//
//  Created by Trainee Alex on 28.04.2021.
//

import UIKit

class CustomFooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupGtadient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGtadient() {
        
        let maskedView = UIView()
        maskedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          
            maskedView.topAnchor.constraint(equalTo: topAnchor),
            maskedView.bottomAnchor.constraint(equalTo: bottomAnchor),
            maskedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            maskedView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        maskedView.backgroundColor = .blue
        
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = maskedView.bounds
        
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
        
        maskedView.layer.mask = gradientMaskLayer
        addSubview(maskedView)
    }
}
