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
//    private var playerStatusObserver: NSKeyValueObservation?
    static var reuseId: String = "AboutViewController"
    let playPauseButton = PlayPauseButton()
    weak var delegate: TouchButtonDelegate?
   
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
    
    var videoContainer: UIView = {
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
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.updatePlayButtonAppearance))
        videoView.addGestureRecognizer(gesture)
        playPauseButton.setup(in: self)
        playPauseButton.addTarget(self, action: #selector(AboutViewController.updatePlayerStatus(sender:)), for: .touchUpInside)
    }
    
    @objc func updatePlayButtonAppearance() {
        UIView.animate(withDuration: 1, animations: {
            self.playPauseButton.updateAppearance()
        })
    }
    
    @objc func updatePlayerStatus(sender: UIButton) {
        if player.isPLaying {
            player.pause()
            self.delegate?.touch(touch: player.isPLaying)
        } else {
            player.play()
            self.delegate?.touch(touch: player.isPLaying)
        }
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
//        let playerFrame = self.videoView.frame
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        playerViewController.view.frame = playerFrame
//        playerViewController.showsPlaybackControls = false
//
//        addChild(playerViewController)
//        self.videoView.addSubview(playerViewController.view)
//        playerViewController.didMove(toParent: self)
  
        
        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = self.videoContainer.bounds
        let path = UIBezierPath(roundedRect:  self.videoContainer.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        self.videoContainer.layer.mask = shape
        self.videoContainer.layer.addSublayer(playerLayer)
        playerLayer.layoutIfNeeded()
    
    }
    
//    func playerStatusDidChange(player: AVPlayer) {
//        playPauseButton.updateImageForState(isPlaying: player.isPLaying)
//    }
    
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
            textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            textView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
//            textView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2)
        ])
        textView.delegate = self
        
        videoView.addSubview(videoContainer)
        NSLayoutConstraint.activate([
            videoContainer.topAnchor.constraint(equalTo: videoView.topAnchor),
            videoContainer.bottomAnchor.constraint(equalTo: videoView.bottomAnchor),
            videoContainer.leadingAnchor.constraint(equalTo: videoView.leadingAnchor),
            videoContainer.trailingAnchor.constraint(equalTo: videoView.trailingAnchor)
        ])
        
        videoView.addSubview(playPauseButton)
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playPauseButton.heightAnchor.constraint(equalToConstant: 100),
            playPauseButton.widthAnchor.constraint(equalToConstant: 100),
            playPauseButton.centerXAnchor.constraint(equalTo: videoView.centerXAnchor),
            playPauseButton.centerYAnchor.constraint(equalTo: videoView.centerYAnchor)
        ])
        
        let fooretView = CustomFooterView(height: 200, width: self.view.frame.width)
        fooretView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fooretView)
        
        NSLayoutConstraint.activate([
            fooretView.heightAnchor.constraint(equalToConstant: 100),
            fooretView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            fooretView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            fooretView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
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

extension AVPlayer {
    var isPLaying: Bool {
        return rate == 1
    }
}
