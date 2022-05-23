//
//  PopularMoviesLoader.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

protocol PopularMoviesLoader {
    func getPupularMovies(completion: @escaping (Result<[Movie], Error>) -> Void)
}
