//
//  ViewController.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    let screen: HomeView
    
    init() {
        screen = HomeView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate = self
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func didTapStartButton() {
        let tabBarVC = TabBarViewController()
        present(tabBarVC, animated: false)
    }
    
    
}


