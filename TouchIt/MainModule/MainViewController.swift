//
//  MainViewController.swift
//  TouchIt
//
//  Created by Trainee Alex on 05.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var segmentsVC: [UIViewController] = []
    var presenter: MainModulePresenterProtocol!
    var stackView = UIStackView()
    var scrollView: UIScrollView!

    var segment: UISegmentedControl = {
        let items = ["About", "Services", "Projects", "Contacts"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        // Set up Frame and SegmentedControl
        let frame = UIScreen.main.bounds
 //       customSC.frame = CGRect(x: frame.minX + 16, y: frame.minY + 88,
 //                               width: frame.width - 32, height: frame.height*0.04)
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        customSC.tintColor = .white
        customSC.selectedSegmentTintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        customSC.layer.borderWidth = 1
        customSC.translatesAutoresizingMaskIntoConstraints = false
        
        // Add target action method
        customSC.addTarget(self, action: #selector(MainViewController.forSegment), for: .valueChanged)
        return customSC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.createMainView()
        self.segmentsVC = self.createAllModule()
        self.setupSlideScrollView(slides: self.segmentsVC)
        
        self.createNavigation()
    }
}

extension MainViewController {
    
    private func createNavigation() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.view.backgroundColor = UIColor.clear

        let titlV = UIView()
        let contentV = UIImageView(frame: CGRect(x: self.view.center.x - 50, y: 0, width: 100, height: 30))
        contentV.image = UIImage(named: "titleView")
        self.view.addSubview(titlV)
        titlV.addSubview(contentV)
        titlV.backgroundColor = .red

        navigationController?.navigationBar.addSubview(titlV)
    }
    
    private func createAllModule() -> [UIViewController] {
        
        var arrayVC: [UIViewController] = []
        
        let vcAbo = AboutWireframe.create()
        arrayVC.append(vcAbo)
        
        let vcSer = ServicesWireframe.create(mainDelegate: self)
        arrayVC.append(vcSer)
        
        let vcPro = ProjectsWireframe.create(mainDelegate: self)
        arrayVC.append(vcPro)
        
        let vcCon = ContactsWireframe.create()
        arrayVC.append(vcCon)
        
        return arrayVC
    }
    
    @objc private func forSegment(sender: UISegmentedControl) {
        let contentOffset = scrollView.bounds.width * CGFloat(sender.selectedSegmentIndex)
        scrollView.setContentOffset(CGPoint(x: contentOffset, y: 0), animated: true)
        
        
//        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
//        segment.selectedSegmentIndex = Int(pageIndex)
    }
    
    func setupSlideScrollView(slides : [UIViewController]) {
        slides.forEach({ slide in
            slide.view.translatesAutoresizingMaskIntoConstraints = false
            self.stackView.addArrangedSubview(slide.view)
            slide.view.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        })
        }
    
    private func createMainView() {
        
        self.scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        self.view.addSubview(segment)
        self.view.addSubview(scrollView)
        
        segment.heightAnchor.constraint(equalToConstant: 35).isActive = true
        segment.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        segment.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        segment.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
       
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.segment.bottomAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        scrollView.delegate = self
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
        
        self.view.layoutIfNeeded()
 
    }
}

extension MainViewController: TransitionServiceToNextDelegate {
   
    func goToNext(logo: Logo) {

        self.navigationController?.pushViewController( ServiceCategoryWireframe.create(logo: logo), animated: true)
    }
}

extension MainViewController: TransitionProjectToNextDelegate {
    
    func goToNext(model: [ProjectModWithImage], index: Int) {
        
        self.navigationController?.pushViewController(ProjectDetailWireframe.create(model: model, index: index), animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        segment.selectedSegmentIndex = Int(pageIndex)
    }
}

extension MainViewController: MainModuleViewProtocol {
    
    func updateView() {
       
}
}
