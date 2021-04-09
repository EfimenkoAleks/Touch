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
    
    var textView: UITextView = {
        let sc = UITextView()
        sc.backgroundColor = .clear
        sc.alwaysBounceVertical = true
        
        sc.translatesAutoresizingMaskIntoConstraints = false
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
    func loadVideo(_ fileName: URL) {
        
            let player = AVPlayer(url: fileName)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.videoView.bounds
            videoView.layer.addSublayer(playerLayer)
 //           self.view.layer.addSublayer(playerLayer)
            player.play()
    }
    
    private func setupConstraints() {

        self.view.addSubview(stacView)

        stacView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stacView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stacView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true

        stacView.addArrangedSubview(videoView)
        stacView.addArrangedSubview(titleLabel)
        stacView.addArrangedSubview(textView)

        videoView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3.1).isActive = true
        videoView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            textView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2.8)
        ])
        textView.delegate = self

        textLabel.text = "Enter some text..."
        textView.addSubview(textLabel)

//        textLabel.textColor = .red
        textLabel.leadingAnchor.constraint(equalTo: stacView.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: stacView.trailingAnchor).isActive = true

        
    }

    private func configure(_ model: AboutModel) {
        if model.video != nil {
            loadVideo(model.video!)
        }
        
        titleLabel.text = model.title
        
        textLabel.text = model.text 
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
            self.view.layoutIfNeeded()
        }
    }
}
