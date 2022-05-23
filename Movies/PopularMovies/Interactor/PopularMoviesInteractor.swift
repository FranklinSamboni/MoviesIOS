//
//  PopularMoviesInteractor.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

class PopularMoviesInteractor {
    
    private let loader: PopularMoviesLoader
    
    init(loader: PopularMoviesLoader) {
        self.loader = loader
    }
    
    func getPupularMovies(completion: @escaping (Result<[MovieViewModel], Error>) -> Void) {
        self.loader.getPupularMovies { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(movies):
                completion(.success(movies.map { MovieViewModel(title: $0.title, overview: $0.overview ,image: $0.posterImage) } ))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
