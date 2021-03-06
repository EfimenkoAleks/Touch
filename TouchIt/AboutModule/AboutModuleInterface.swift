//
//  AboutModuleInterface.swift
//  TouchIt
//
//  Created by Trainee Alex on 07.04.2021.
//

import UIKit

protocol AboutModuleViewProtocol: class {
    func updateView()
}

protocol AboutModulePresenterProtocol {
    var aboutMod: AboutModel { get }
    func fechVideo()
}

protocol AboutModuleInteractorProtocol {
    func getVideo(name: String, completion: @escaping(AboutModel?) -> ())
}

protocol AboutModuleRouterProtocol {
    func goToSecondScreen()
}

protocol TouchButtonDelegate: class {
    func touch(touch: Bool)
}
