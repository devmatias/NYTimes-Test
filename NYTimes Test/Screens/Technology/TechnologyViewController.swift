//
//  NewsSelectionViewController.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import UIKit
import AlamofireImage

class TechnologyViewController: UIViewController {
    
    let screen: NewsView
    let identifier: String
    let viewModel: NewsViewModel

    init(viewModel: NewsViewModel) {
        screen = NewsView()
        identifier = "technology"
        self.viewModel = viewModel
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
        setupTableView()
        viewModel.loadNews(identifier: identifier)
        viewModel.newsFound = { [weak self] in
            self?.screen.tableView.reloadData()
        }
        title = "Technology"
    }

    func setupTableView() {
        screen.tableView.dataSource = self
        screen.tableView.delegate = self
        screen.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
}

extension TechnologyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.listOfNews[indexPath.row]
        let resultVC = ResultViewController()
        resultVC.screen.firstLabel.text = news.title
        resultVC.screen.secondLabel.text = news.abstract
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
}

extension TechnologyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listOfNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.setup(viewModel.listOfNews[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}

