//
//  PopularMoviesLoader.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

class PopularMoviesRemoteLoader: PopularMoviesLoader {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getPupularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        self.httpClient.get(url: PopularMoviesEndpoint.get.url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success((data, httpResponse)):
                do {
                    let movies = try MoviesAPIMapper.map(data, from: httpResponse)
                    self.complete(onMainQueue: completion, with: .success(movies))
                } catch {
                    self.complete(onMainQueue: completion, with: .failure(error))
                }
            case let .failure(error):
                self.complete(onMainQueue: completion, with: .failure(error))
            }
        }
    }
    
    private func complete(onMainQueue completion: @escaping (Result<[Movie], Error>) -> Void, with result: Result<[Movie], Error> ) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
