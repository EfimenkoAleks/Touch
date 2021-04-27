//
//  PlayPauseButton.swift
//  TouchIt
//
//  Created by Trainee Alex on 27.04.2021.
//

import UIKit
import AVKit

class PlayPauseButton: UIView {
    var kvoRateContext = 0
    var avPlayer: AVPlayer?
    var timer: Timer?
    var isVisible: Bool = true
    var isPlaying: Bool {
        return avPlayer?.rate != 0 && avPlayer?.error == nil
    }

    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &kvoRateContext)
    }

    func setup(in container: UIViewController) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)
        self.backgroundColor = .clear

        updatePosition()
        updateUI()
        addObservers()
    }

    @objc func tapped(_ sender: UITapGestureRecognizer) {
       
        updateStatus()
        updateUI()
        updateTimer()
    }
    
    @objc func clearBackground() {
 //       UIView.animate(withDuration: 1) {
            self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0)
//        }
    }
    
    private func updateTimer() {

        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(clearBackground),
                                         userInfo: nil,
                                         repeats: false)
        timer?.tolerance = 0.1
    }

    private func updateStatus() {
        if isPlaying {
            avPlayer?.pause()
        } else {
            avPlayer?.play()
        }
    }

    func updateUI() {
        if isPlaying {
            setBackgroundImage(name: "pause.circle")
        } else {
            setBackgroundImage(name: "play.circle")
        }
    }
    
    func updatePosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }

    private func setBackgroundImage(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage(systemName: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: image)
    }

    private func handleRateChanged() {
        updateUI()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let context = context else { return }

        switch context {
        case &kvoRateContext:
            handleRateChanged()
        default:
            break
        }
    }
}
