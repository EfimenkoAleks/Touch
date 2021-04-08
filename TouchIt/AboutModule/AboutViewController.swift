//
//  AboutViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import UIKit
import AVKit

class AboutViewController: UIViewController {
    
    var presenter: AboutModulePresenterProtocol!
    
    static var reuseId: String = "AboutViewController"
   
    var videoView: UIView = {
        let imView = UIView()
        imView.backgroundColor = .systemPink
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()
    
    var textLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 21)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var scrollView: UIScrollView = {
        let sc = UIScrollView()
        
        return sc
    }()
    
    var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 50)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var stacView: UIStackView = {
        let stackV   = UIStackView()
        stackV.axis  = NSLayoutConstraint.Axis.vertical
        stackV.distribution  = UIStackView.Distribution.equalSpacing
        stackV.alignment = UIStackView.Alignment.center
        stackV.backgroundColor = .clear
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.spacing = 15.0
        return stackV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupConstraints()
//        self.textLabel.delegate = self
        self.presenter.fechVideo()
    }
    
   
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        contentView.subviews.forEach({
//            $0.removeFromSuperview()
//        })
//    }
    
//    func fill(with content: UIView) {
//        contentView.addSubview(content)
//    }

    
}

// MARK: - Setup Constraints
extension AboutViewController {
    
    // AVPlayer
    func loadVideo(name: String) {
 //       let fileName = "video.mp4"
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath = paths.first {
            let videoUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(name)
            
////            let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: videoUrl)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            videoView.layer.addSublayer(playerLayer)
 //           self.view.layer.addSublayer(playerLayer)
            player.play()
        }
    }
    
    private func setupConstraints() {

        self.view.addSubview(stacView)

        stacView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stacView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stacView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true

        stacView.addArrangedSubview(videoView)
        stacView.addArrangedSubview(titleLabel)
        stacView.addArrangedSubview(textLabel)

        videoView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3.1).isActive = true
        videoView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        textLabel.leadingAnchor.constraint(equalTo: stacView.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: stacView.trailingAnchor).isActive = true
        
      
    }

    private func configure(neme: String) {
        loadVideo(name: neme)
        
        titleLabel.text = "About"
        
        textLabel.text = "We create solutions for your business. Team of specialists with passion to get success. Our strong area is IOS and Android development. Mobile phone is that thing which people pick up each morning when they get up and put out when you are going to sleep. We are striving for that time which people are spending with their digital friend would be comfortable for them and most effective. Do you wanna to raise your business and do it the fastest way? Do you wanna to share your great idea with the world? Mobile application is the best way. Choose the succeed one."
    }
}


extension AboutViewController: AboutModuleViewProtocol {
    func updateView() {
        self.configure(neme: self.presenter.nameVideo)
        self.view.layoutIfNeeded()
    }
    
    
}
