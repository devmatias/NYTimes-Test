//
//  NewsSelectionTableViewCell.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"
    
    var cellImage: UIImageView = {
        let image = UIImage(systemName: "newspaper.fill")
        let view = UIImageView(image: image)
        view.tintColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.text = "Title"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Author"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ news: ResultInfo) {
        firstLabel.text = news.title
        secondLabel.text = news.byline
        accessoryType = .disclosureIndicator
    }
    
}

extension NewsTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(cellImage)
        addSubview(firstLabel)
        addSubview(secondLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            cellImage.heightAnchor.constraint(equalToConstant: 40),
            cellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            cellImage.widthAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 8),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 8),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    
}





