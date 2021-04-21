//
//  ServicesPresenter.swift
//  TouchIt
//
//  Created by user on 07.04.2021.
//

import Foundation

class ServicesPresenter {
    
    var interactor: ServicesModuleInteractorProtocol
    weak var view: ServicesModuleViewProtocol?
    var router: ServicesModuleRouterProtocol
    private var logos = [Logo]() //["image1", "image2", "image3", "image4", "image5", "image6"]
   
    
    init(
        view: ServicesModuleViewProtocol? = nil,
        interactor: ServicesModuleInteractorProtocol,
        router: ServicesModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.logos = createLogo()
    }
    
}

extension ServicesPresenter {
    
    private func createLogo() -> [Logo] {
        var logs = [Logo]()
        let logo1 = Logo(logoImage: "image1", logeTitle: "iOS")
        logs.append(logo1)
        
        let logo2 = Logo(logoImage: "image2", logeTitle: "Android")
        logs.append(logo2)
        
        let logo3 = Logo(logoImage: "image3", logeTitle: "Design")
        logs.append(logo3)
        
        let logo4 = Logo(logoImage: "image4", logeTitle: "Support")
        logs.append(logo4)
        let logo5 = Logo(logoImage: "image5", logeTitle: "Remote")
        logs.append(logo5)
        let logo6 = Logo(logoImage: "image6", logeTitle: "Team")
        logs.append(logo6)
        
        return logs
    }
}

extension ServicesPresenter: ServicesModulePresenterProtocol {
    func curentLogo(index: Int) -> Logo {
        return self.logos[index]
    }
    
    var countIcons: Int {
        return self.logos.count
    }
}
