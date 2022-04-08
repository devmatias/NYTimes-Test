//
//  APIClient.swift
//  NYTimes Test
//
//  Created by Matias Correa Franco de Faria on 15/03/22.
//

import Foundation
import Alamofire

enum NewsError: Error {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}


struct APIClient {
    
    let basePath = "https://api.nytimes.com/svc/topstories/v2/"
    let apiKey = "api-key=tbcKq5m4Bah3yMuEUSUkHGGMGHV3T6HK"
    
    let session: URLSession = URLSession(configuration: .default)
    
    public func loadNews(with identifier: String, completion: @escaping (_ result: Result<[ResultInfo], NewsError>) -> Void) {
        guard let resourceURL = URL(string: "\(basePath)\(identifier).json?\(apiKey)" ) else {
            completion(.failure(NewsError.url))
            return
        }
        let dataTask = session.dataTask(with: resourceURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    DispatchQueue.main.async {
                        completion(.failure(NewsError.noResponse))
                    }
                    return
                }
                if response.statusCode == 200 {
                    guard let jsonData = data else {return}
                    do {
                        let decoder = JSONDecoder()
                        let newsData = try decoder.decode(NewsData.self, from: jsonData)
                        let resultInfo = newsData.results
                        DispatchQueue.main.async {
                            completion(.success(resultInfo))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(.taskError(error: error)))
                        }

                    }
                } else {
                    print("Algum status inválido pelo servidor!!")
                    DispatchQueue.main.async {
                        completion(.failure(NewsError.responseStatusCode(code: response.statusCode)))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(NewsError.taskError(error: error!)))
                }
            }

        }
        dataTask.resume()
    }

}

