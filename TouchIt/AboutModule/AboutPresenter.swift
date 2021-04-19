//
//  AboutPresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import Foundation

class AboutPresenter {
    
    var interactor: AboutModuleInteractorProtocol
    weak var view: AboutModuleViewProtocol?
    var router: AboutModuleRouterProtocol
    private var video = "video.mp4"
    private var aboutModel: AboutModel
    
    init(
        view: AboutModuleViewProtocol? = nil,
        interactor: AboutModuleInteractorProtocol,
        router: AboutModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.aboutModel = AboutModel(video: URL(string: ""), title: "", text: "")
    }
    
}

extension AboutPresenter: AboutModulePresenterProtocol {
   
    var aboutMod: AboutModel {
        self.aboutModel
    }
    
    func fechVideo() {
        
        self.interactor.getVideo(name: self.video) { (rezult) in
            if rezult != nil {
                self.aboutModel.video = rezult?.video
                self.aboutModel.title = rezult?.title ?? "No Title"
                self.aboutModel.text = rezult?.text ?? "No text"
            } else {
                self.aboutModel.video = nil
            }
//            self.aboutModel.title = "About"
//            self.aboutModel.text = "We create solutions for your business. Team of specialists with passion to get success. Our strong area is IOS and Android development. Mobile phone is that thing which people pick up each morning when they get up and put out when you are going to sleep. We are striving for that time which people are spending with their digital friend would be comfortable for them and most effective. Do you wanna to raise your business and do it the fastest way? Do you wanna to share your great idea with the world? Mobile application is the best way. Choose the succeed one."
//            self.view?.updateView()
        }
    }
}
