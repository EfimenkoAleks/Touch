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
              
                self.aboutModel.video = nil // rezult?.video
                self.aboutModel.title = rezult?.title ?? "No Title"
                self.aboutModel.text = rezult?.text ?? "No text"
            } else {
                self.aboutModel.video = nil
            }
            self.view?.updateView()
        }
    }
}
