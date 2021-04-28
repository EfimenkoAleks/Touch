//
//  CustomFooterView.swift
//  TouchIt
//
//  Created by Trainee Alex on 28.04.2021.
//

import UIKit

class CustomFooterView: UIView {
    
    private var height: CGFloat
    private var  width: CGFloat
    
    override init(frame: CGRect) {
        self.height = 0
        self.width = 0
        super.init(frame: frame)
    }
    
    convenience init(height: CGFloat, width: CGFloat) {
        self.init()
        self.height = height
        self.width = width
        
        self.setupGtadient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGtadient() {
        
        let maskedView = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height))
       
        maskedView.backgroundColor = .black
        
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = maskedView.bounds
        
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradientMaskLayer.locations = [0, 0.7, 1]
        
        maskedView.layer.mask = gradientMaskLayer
        addSubview(maskedView)
    }
}
