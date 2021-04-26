//
//  ContentVC.swift
//  TouchIt
//
//  Created by Trainee Alex on 26.04.2021.
//

import UIKit

class ContentVC: UIViewController {
    
    var photo: UIImageView = {
       let im = UIImageView()
        im.backgroundColor = .systemGroupedBackground
        im.contentMode = .scaleAspectFit
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    override func viewDidLoad() {
            super.viewDidLoad()

            view.addSubview(photo)
            NSLayoutConstraint.activate([
                photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                photo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 25),
                photo.widthAnchor.constraint(equalTo: view.widthAnchor),
                photo.heightAnchor.constraint(equalToConstant: view.frame.height / 4 * 1.9)
                ])

        }
}
