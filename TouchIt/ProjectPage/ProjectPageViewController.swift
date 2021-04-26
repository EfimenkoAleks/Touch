//
//  ProjectPageViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 23.04.2021.
//

import UIKit

class ProjectPageViewController: UIPageViewController {
    
    var presenter: ProjectPageModulePresenterProtocol!
    private var tableView: UITableView!
    
    private var pages: [UIViewController] = [UIViewController]()
    private var numberPage: Int = 0
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
            super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.numberPage = self.presenter.curentIndex
        self.createBarItem()
       
        dataSource = self
                delegate = nil

                // instantiate "pages"
        for i in 0..<self.presenter.countPhoto {
                    let vc = ContentVC()
            vc.photo.image = UIImage(data: self.presenter.curentPhoto(index: i))
                    pages.append(vc)
                }
        setViewControllers([pages[self.presenter.curentIndex]], direction: .forward, animated: false, completion: nil)
            
    }
    
    // MARK: Create BarbuttonItem
    
    func createBarItem(){
            
            let scaleConfig2 = UIImage.SymbolConfiguration(scale: .large)
            let imageSend = UIImage(systemName: "square.and.arrow.up", withConfiguration: scaleConfig2)!
            let imageTemp2 = imageSend.withRenderingMode(.alwaysTemplate)
            let send = UIBarButtonItem(image: imageTemp2, style: .plain, target: self, action: #selector(ProjectPageViewController.sendPhoto))
        send.tintColor = .white
            
            self.navigationItem.rightBarButtonItem = send
        }
    
    // для отправки ссылки кому то
        @objc private func sendPhoto() {
            
 //           if let str = self.viewModel.webString {
            let activityVC = UIActivityViewController(activityItems: [self.presenter.curentPhoto(index: self.numberPage)], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil)
 //           }
        }
}

extension ProjectPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1
        self.numberPage = previousIndex

        guard previousIndex >= 0 else { return pages.last }

        guard pages.count > previousIndex else { return nil }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1
        self.numberPage = nextIndex

        guard nextIndex < pages.count else { return pages.first }

        guard pages.count > nextIndex else { return nil }

        return pages[nextIndex]
    }
}

extension ProjectPageViewController: UIPageViewControllerDelegate {

    // if you do NOT want the built-in PageControl (the "dots"), comment-out these funcs

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {

        guard let firstVC = pageViewController.viewControllers?.first else {
            return 0
        }
        guard let firstVCIndex = pages.firstIndex(of: firstVC) else {
            return 0
        }

        return firstVCIndex
    }
}

extension ProjectPageViewController: ProjectPageModuleViewProtocol {
    func updateView() {
        
    }
    
    
}

