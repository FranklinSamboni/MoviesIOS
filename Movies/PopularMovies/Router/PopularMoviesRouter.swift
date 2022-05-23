//
//  PopularMoviesRouter.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import UIKit

class PopularMoviesRouter {
    
    static func createPopularMoviesWith(httpClient: HTTPClient) -> PopularMoviesViewController {
        let loader = PopularMoviesRemoteLoader(httpClient: httpClient)
        let interactor = PopularMoviesInteractor(loader: loader)
        
        let popularMoviesViewController = makePopularMovesViewController(title: "Popular Movies")
        let presenter = PopularMoviesPresenter(view: popularMoviesViewController, interactor: interactor)
        
        popularMoviesViewController.presenter = presenter
        return popularMoviesViewController
    }
    
    private static func makePopularMovesViewController(title: String) -> PopularMoviesViewController {
        let bundle = Bundle(for: PopularMoviesViewController.self)
        let storyboard = UIStoryboard(name: "PopularMovies", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! PopularMoviesViewController
        controller.title = title
        return controller
    }
}
