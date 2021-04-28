//
//  PlayPauseButton.swift
//  TouchIt
//
//  Created by Trainee Alex on 27.04.2021.
//

import UIKit
import AVKit

class PlayPauseButton: UIButton, TouchButtonDelegate {

    var timer: Timer?
 
    func setup(in container: AboutViewController) {

        self.backgroundColor = .clear
        container.delegate = self
        tintColor = .black
        
        setPauseImage()
        UIView.animate(withDuration: 1.0) {
            self.updateAppearance()
        }
    }
    
//    @objc func clearBackground() {
// //       UIView.animate(withDuration: 1) {
////            self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0)
//  //          self.alpha = 0
//  //      }
//        updateAppearance()
//    }
//
//    private func updateTimer() {
//
//        timer = nil
//        timer = Timer.scheduledTimer(timeInterval: 1.0,
//                                         target: self,
//                                         selector: #selector(clearBackground),
//                                         userInfo: nil,
//                                         repeats: false)
//        timer?.tolerance = 0.1
//    }

    func updateAppearance() {
        let newAlpha: CGFloat = alpha == 0 ? 1 : 0
        alpha = newAlpha
    }
    
    func updateImageForState(isPlaying: Bool) {
        if isPlaying {
            setPauseImage()
        } else {
            setPlayImage()
        }
        UIView.animate(withDuration: 1.0) {
            self.updateAppearance()
        }
    }
    
    func setPauseImage() {
        let image = UIImage(systemName: "pause.circle")
        setBackgroundImage(image, for: .normal)
    }
    
    func setPlayImage() {
        let image = UIImage(systemName: "play.circle")
        setBackgroundImage(image, for: .normal)
    }
    
    func touch(touch: Bool) {
        updateImageForState(isPlaying: touch)
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
}

