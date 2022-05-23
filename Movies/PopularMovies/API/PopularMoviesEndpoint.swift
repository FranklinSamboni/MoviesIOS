//
//  PopularMoviesEndpoint.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

enum PopularMoviesEndpoint {
    
    private static let baseURL = "https://api.themoviedb.org/3/"
    private static let apiKey = Secret.apiKey
    
    case get

    var url: URL {
        switch self {
        case .get:
            return URL(string: PopularMoviesEndpoint.baseURL + "movie/popular?api_key=\(PopularMoviesEndpoint.apiKey)&language=en-US&page=1")!
        }
    }
}
