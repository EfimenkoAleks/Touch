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
        imView.backgroundColor = .orange
        imView.contentMode = .center
        imView.layer.masksToBounds = true
        
//        imView.layer.cornerRadius = 20
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
        sc.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        
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
    
    var contentView: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .clear
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
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
    func loadVideo(_ fileName: URL) {
        
        let player = AVPlayer(url: fileName)
        let playerLayer = AVPlayerLayer(player: player)
        
        videoView.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = self.videoView.bounds
        let path = UIBezierPath(roundedRect:  self.videoView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        self.videoView.layer.mask = shape
        self.videoView.layer.insertSublayer(playerLayer, at: 0)
        playerLayer.layoutIfNeeded()
        player.play()
    }
    
    private func setupConstraints() {

        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
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
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        contentView.addSubview(videoView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)

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
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
 //           textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            textView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
//            textView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2)
        ])
        textView.delegate = self

//        let rectangle = CGRect(x: 0, y: 0, width: 100, height: 100)
//        let path = UIBezierPath(roundedRect: videoView.layer.visibleRect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
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
