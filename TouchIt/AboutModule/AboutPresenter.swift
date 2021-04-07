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
   
    
    init(
        view: AboutModuleViewProtocol? = nil,
        interactor: AboutModuleInteractorProtocol,
        router: AboutModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension AboutPresenter: AboutModulePresenterProtocol {
   
    var nameVideo: String {
        self.video
    }
    
    func fechVideo() {
        
        self.interactor.getVideo(name: self.video) { (bool) in
            if bool == true {
                self.view?.updateView()
            }
        }
    }
}
