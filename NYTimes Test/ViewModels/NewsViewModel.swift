//
//  TechnologyViewModel.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 29/03/22.
//

import Foundation

//Observable class

class NewsViewModel {
    
    let apiClient = APIClient()
    var newsFound: (() -> ())?
    var listOfNews: [ResultInfo] = []
    
    
    func loadNews(identifier: String) {
        apiClient.loadNews(with: identifier) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let listOfNews):
                self.listOfNews = listOfNews
                self.newsFound?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
   
}
