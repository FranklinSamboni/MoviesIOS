//
//  PopularMoviesView.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

protocol PopularMoviesView: AnyObject {
    func display(_ movies: [MovieViewModel])
    func display(_ error: ErrorViewModel)
    func display(loading: Bool)
}
