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
    var nameVideo: String { get }
    func fechVideo()
}

protocol AboutModuleInteractorProtocol {
    func getVideo(name: String, completion: @escaping(Bool) -> ())
}

protocol AboutModuleRouterProtocol {
    func goToSecondScreen()
}
