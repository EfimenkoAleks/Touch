//
//  MainCollectionCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import Foundation
import UIKit
import AVKit

class AboutCell: UICollectionViewCell {
    
    static var reuseId: String = "AboutCell"
   
    var videoView: UIView = {
        let imView = UIView()
        imView.backgroundColor = .systemPink
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()
    
    var textLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.text = ""
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        self.loadVideo()
        
        textLabel.text = "init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented , init(coder:) has not been implemented ."
    }
    
    func configure(with icon: String) {
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup Constraints
extension AboutCell {
    
    // AVPlayer
    func loadVideo() {
        let fileName = "video.mp4"
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath = paths.first {
            let videoUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            
//            let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            let player = AVPlayer(url: videoUrl)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            videoView.layer.addSublayer(playerLayer)
 //           self.view.layer.addSublayer(playerLayer)
            player.play()
        }
    }
    
    func setupConstraints() {

        contentView.addSubview(stacView)

        stacView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stacView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        stacView.addArrangedSubview(videoView)
        stacView.addArrangedSubview(textLabel)

        videoView.heightAnchor.constraint(equalToConstant: 370).isActive = true
        
        textLabel.leadingAnchor.constraint(equalTo: stacView.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: stacView.trailingAnchor).isActive = true
    }
}
