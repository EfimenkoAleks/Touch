//
//  AboutViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import UIKit
import AVKit
import AVFoundation

class AboutViewController: UIViewController {
    
    var presenter: AboutModulePresenterProtocol!
    private var player: AVPlayer!
    private var playerStatusObserver: NSKeyValueObservation?
    static var reuseId: String = "AboutViewController"
    var playPauseButton: PlayPauseButton!
   
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var videoView: UIView = {
        let imView = UIView()
        imView.backgroundColor = .clear
        imView.contentMode = .center
        imView.layer.masksToBounds = true
        imView.translatesAutoresizingMaskIntoConstraints = false
        return imView
    }()
    
    var textView: UITextView = {
        let sc = UITextView()
        sc.backgroundColor = .clear
        sc.alwaysBounceVertical = true
        sc.isScrollEnabled = false
        sc.textColor = .white
        sc.isEditable = false
        sc.isSelectable = false
        sc.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        lb.text = ""
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var contentView: UIStackView = {
        let stackV   = UIStackView()
        stackV.axis  = NSLayoutConstraint.Axis.vertical
        stackV.distribution  = UIStackView.Distribution.equalSpacing
        stackV.alignment = UIStackView.Alignment.center
        stackV.backgroundColor = .clear
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.spacing = 5.0
        return stackV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupConstraints()
        self.presenter.fechVideo()
    }
}

// MARK: - Setup Constraints
extension AboutViewController {
    
    // AVPlayer
    func loadVideo(_ fileName: URL) {
        print("\(fileName)")
        
        let player = AVPlayer(url: fileName)
        self.player = player
//        playerStatusObserver = self.player.observe(\.status, changeHandler: { player, _ in
//            switch player.status {
//            case .readyToPlay:
//                player.play()
//            case .failed:
//                debugPrint("Player setup failed!!!!")
//            default:
//                break
//            }
//        })
        player.rate = 1 //auto play
        let playerFrame = self.videoView.frame
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = true

        addChild(playerViewController)
        self.videoView.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
       
        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        self.videoView.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
        
        let playerLayer = AVPlayerLayer(player: player)

        videoView.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = self.videoView.bounds
        let path = UIBezierPath(roundedRect:  self.videoView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        self.videoView.layer.mask = shape
        self.videoView.layer.addSublayer(playerLayer)
        playerLayer.layoutIfNeeded()
    }
    
    private func setupConstraints() {

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70),
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        contentView.addArrangedSubview(videoView)
        contentView.addArrangedSubview(titleLabel)
        contentView.addArrangedSubview(textView)

        NSLayoutConstraint.activate([
            videoView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3.5),
            videoView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 2),
            videoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            videoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
 //           videoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
 //           textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            textView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
//            textView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2)
        ])
        textView.delegate = self
    }

    private func configure(_ model: AboutModel) {
        if model.video != nil {
            loadVideo(model.video!)
        }
        
        titleLabel.text = model.title
        textView.text = model.text
    }
}

extension AboutViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
  //          placeholderLabel.isHidden = !textView.text.isEmpty
        }
}


extension AboutViewController: AboutModuleViewProtocol {
    func updateView() {
        DispatchQueue.main.async {
            self.configure(self.presenter.aboutMod)
//            self.view.layoutIfNeeded()
        }
    }
}

extension AboutViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
    }
}

