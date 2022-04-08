//
//  HomeVIew.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapStartButton()
}

public class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    var background: UIImageView = {
        let backgroundImage = "backgroundimage.png"
        let image = UIImage(named: backgroundImage)
        let view = UIImageView(image: image!)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    var logoImage: UIImageView = {
        let stringImage = "tnytlogo.jpg"
        let image = UIImage(named: stringImage)
        let view = UIImageView(image: image!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var startButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .init(white: 1, alpha: 0.75)
        view.tintColor = .black
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.setTitle("START", for: .normal)
        view.layer.cornerRadius = 26.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapStartButton() {
        delegate?.didTapStartButton()
    }

}

extension HomeView: CodeView {

    func buildViewHierarchy() {
        addSubview(background)
        addSubview(logoImage)
        addSubview(startButton)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            logoImage.heightAnchor.constraint(equalToConstant: 196),
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 160)
        ])
        
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 64),
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -160)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
