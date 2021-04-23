//
//  ProjectDetailModulePresenter.swift
//  TouchIt
//
//  Created by Trainee Alex on 21.04.2021.
//

import Foundation

enum ContentImage {
    case mainImage(Data)
    case title(String)
    case description(String)
    case moreImage([Data])
    case lastImage(Data)
}

class ProjectDetailPresenter {
    
    var interactor: ProjectDetailModuleInteractorProtocol
    weak var view: ProjectDetailModuleViewProtocol?
    var router: ProjectDetailModuleRouterProtocol
    private var model: [ProjectModWithImage]
    private var indexModel: Int
    private var projectModel: [ContentImage] = []
    
    init(model: [ProjectModWithImage], index: Int,
        view: ProjectDetailModuleViewProtocol? = nil,
        interactor: ProjectDetailModuleInteractorProtocol,
        router: ProjectDetailModuleRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.model = model
        self.indexModel = index
    }
}

extension ProjectDetailPresenter: ProjectDetailModulePresenterProtocol {
    func fetchProject() {
        self.interactor.fetchPhotos { [weak self] (data) in
            guard let self = self else { return }
            var indexNext = 0
            if self.indexModel == self.model.count - 1 {
                indexNext = 0
            } else {
                indexNext = self.indexModel + 1
            }
            self.projectModel.removeAll()
            
            self.projectModel.append(.mainImage(self.model[self.indexModel].mainImageUrl!))
            self.projectModel.append(.title(self.model[self.indexModel].name))
            self.projectModel.append(.description(self.model[self.indexModel].description))
            self.projectModel.append(.moreImage(data))
            self.projectModel.append(.lastImage(self.model[indexNext].mainImageUrl!))
            
            DispatchQueue.main.async {
                self.view?.updateView()
            }
        }
    }
    
    func goTonextController(items: [Data], initialItem: Int) {
        self.router.goTonextController(items: items, initialItem: initialItem)
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = projectModel[index.section]
        switch item {
        case let .moreImage(imagesData):
            goTonextController(items: imagesData, initialItem: index.item)
            
        case .lastImage:
            view?.restoreContentOffset()
            nextProject()
        default: break
        }
    }
    
    func nextProject() {
        if self.indexModel == self.model.count - 1 {
            self.indexModel = 0
        } else {
           self.indexModel += 1
        }
        self.fetchProject()
    }
    
    func curentModel(by: Int) -> ContentImage {
        return self.projectModel[by]
    }
    
    var countElements: Int {
        return self.projectModel.count
    }
    
}
