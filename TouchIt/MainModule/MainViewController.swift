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
    var scrollView: UIScrollView!

    
    var segment: UISegmentedControl = {
        let items = ["About", "Services", "Projects", "Contacts"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        // Set up Frame and SegmentedControl
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x: frame.minX + 16, y: frame.minY + 88,
                                width: frame.width - 32, height: frame.height*0.04)
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0
        customSC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        customSC.tintColor = .brown
        customSC.selectedSegmentTintColor = #colorLiteral(red: 0.9608978426, green: 0.912968934, blue: 0.8459051666, alpha: 1)
        customSC.layer.borderWidth = 1
        
        // Add target action method
        customSC.addTarget(self, action: #selector(MainViewController.forSegment), for: .valueChanged)
        return customSC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
       
        self.createAllModule()
        self.createMainView()
        

        // Do any additional setup after loading the view.
    }
   
}

extension MainViewController {
    
    private func createAllModule() {
        let vc = AboutWireframe.create()
        self.segmentsVC.append(vc)
    }
    
    @objc private func forSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
    }
    
    private func createMainView() {
        
        self.scrollView = UIScrollView()
        self.view.addSubview(segment)
        self.view.addSubview(scrollView)
     
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.segment.bottomAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.view.layoutIfNeeded()
 //       let view2 = self.segmentsVC[0].view
//        view2?.leadingAnchor
        self.scrollView.addSubview(self.segmentsVC[0].view)
        
        
        // scrollView
//        let scrollView : UIScrollView = UIScrollView(frame: CGRect(x: 80, y: 80,
//            width: 250, height: 300))
//            scrollView.isPagingEnabled = true
//            scrollView.backgroundColor = .orange
//            view.addSubview(scrollView)
//            let numberOfPages :Int = 5
//            let padding : CGFloat = 15
//            let viewWidth = scrollView.frame.size.width - 2 * padding
//            let viewHeight = scrollView.frame.size.height - 2 * padding
//
//            var x : CGFloat = 0
//
//            for i in 0...numberOfPages{
//                let view: UIView = UIView(frame: CGRect(x: x + padding, y: padding, width: viewWidth, height: viewHeight))
//                view.backgroundColor = UIColor.white
//                scrollView .addSubview(view)
//
//                x = view.frame.origin.x + viewWidth + padding
//            }
//
//            scrollView.contentSize = CGSize(width:x+padding, height:scrollView.frame.size.height)
    }
}

extension MainViewController: MainModuleViewProtocol {
    
    func updateView() {
       
}
}
//
//extension MainViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let segment = segments[indexPath.row]
//        cell.fill(with: segment.view)
//        switch indexPath.item {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutCell.reuseId, for: indexPath) as! AboutCell
//            cell.configure(neme: self.presenter.nameVideo)
//            return cell
//
//        default:
//           return UICollectionViewCell()
//        }
//    }
//
//
//}
//
//extension MainViewController: UICollectionViewDelegate {
//
//}
