//
//  News.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import Foundation

struct NewsData: Decodable {
    let results: [ResultInfo]
    let section: String
    
    

}

struct ResultInfo: Decodable {
    let title: String
    let abstract: String
    let byline: String
}

