//
//  MainCollectionCell.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

//import Foundation
//import UIKit
//import AVKit
//
//class AboutCell: UICollectionViewCell {
//
//    static var reuseId: String = "AboutCell"
//
//    var videoView: UIView = {
//        let imView = UIView()
//        imView.backgroundColor = .systemPink
//        imView.translatesAutoresizingMaskIntoConstraints = false
//        return imView
//    }()
//
//    var textLabel: UILabel = {
//        let lb = UILabel()
//        lb.textAlignment = .center
//        lb.font = UIFont.systemFont(ofSize: 17)
//        lb.text = ""
//        lb.backgroundColor = .clear
//        lb.numberOfLines = 0
//        lb.translatesAutoresizingMaskIntoConstraints = false
//        return lb
//    }()
//
//    var titleLabel: UILabel = {
//        let lb = UILabel()
//        lb.textAlignment = .center
//        lb.font = UIFont.systemFont(ofSize: 30)
//        lb.text = ""
//        lb.backgroundColor = .clear
//        lb.numberOfLines = 0
//        lb.translatesAutoresizingMaskIntoConstraints = false
//        return lb
//    }()
//
//    var stacView: UIStackView = {
//        let stackV   = UIStackView()
//        stackV.axis  = NSLayoutConstraint.Axis.vertical
//        stackV.distribution  = UIStackView.Distribution.equalSpacing
//        stackV.alignment = UIStackView.Alignment.center
//        stackV.backgroundColor = .clear
//        stackV.translatesAutoresizingMaskIntoConstraints = false
//        stackV.spacing = 15.0
//        return stackV
//    }()
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        contentView.subviews.forEach({
//            $0.removeFromSuperview()
//        })
//    }
//
//    func fill(with content: UIView) {
//        contentView.addSubview(content)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupConstraints()
//    }
//
//    func configure(neme: String) {
//        loadVideo(name: neme)
//
//        titleLabel.text = "About"
//
//        textLabel.text = "We create solutions for your business. Team of specialists with passion to get success. Our strong area is IOS and Android development. Mobile phone is that thing which people pick up each morning when they get up and put out when you are going to sleep. We are striving for that time which people are spending with their digital friend would be comfortable for them and most effective. Do you wanna to raise your business and do it the fastest way? Do you wanna to share your great idea with the world? Mobile application is the best way. Choose the succeed one."
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//// MARK: - Setup Constraints
//extension AboutCell {
//
//    // AVPlayer
//    func loadVideo(name: String) {
// //       let fileName = "video.mp4"
//        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
//        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
//        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
//        if let dirPath = paths.first {
//            let videoUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(name)
//
//////            let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//            let player = AVPlayer(url: videoUrl)
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.videoView.bounds
//            videoView.layer.addSublayer(playerLayer)
// //           self.view.layer.addSublayer(playerLayer)
//            player.play()
//        }
//    }
//
//    func setupConstraints() {
//
//        contentView.addSubview(stacView)
//
//        stacView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        stacView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        stacView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//
//        stacView.addArrangedSubview(videoView)
//        stacView.addArrangedSubview(titleLabel)
//        stacView.addArrangedSubview(textLabel)
//
//        videoView.heightAnchor.constraint(equalToConstant: 370).isActive = true
//        videoView.widthAnchor.constraint(equalToConstant: 260).isActive = true
//
//        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//
//        textLabel.leadingAnchor.constraint(equalTo: stacView.leadingAnchor).isActive = true
//        textLabel.trailingAnchor.constraint(equalTo: stacView.trailingAnchor).isActive = true
//    }
//}
