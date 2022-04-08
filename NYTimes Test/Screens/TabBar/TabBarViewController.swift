//
//  TabBarCreation.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 25/03/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        setUpControllers()
    }
    
    func setUpControllers() {
        let tabBarC = UITabBarController()
        let newsVM = NewsViewModel()
        let technology = TechnologyViewController(viewModel: newsVM)
        let science = ScienceViewController(viewModel: newsVM)
        let nav1 = UINavigationController(rootViewController: technology)
        let nav2 = UINavigationController(rootViewController: science)
        tabBarC.tabBar.tintColor = .black
        
        nav1.tabBarItem = UITabBarItem(
            title: "Technology",
            image: UIImage(systemName: "iphone.radiowaves.left.and.right"),
            tag: 1)
        nav2.tabBarItem = UITabBarItem(
            title: "Science",
            image: UIImage(systemName: "brain"),
            tag: 2)
        
        
        tabBarC.modalPresentationStyle = .fullScreen
        tabBarC.setViewControllers([nav1, nav2], animated: false)
        present(tabBarC, animated: true)
        
    }

}

