//
//  PopularMoviesPresenter.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

protocol PopularMoviesPresenterInput {
    func fetchMovies()
}

class PopularMoviesPresenter {
    
    private let interactor: PopularMoviesInteractor
    private weak var view: PopularMoviesView?
    
    init(view: PopularMoviesView, interactor: PopularMoviesInteractor) {
        self.view = view
        self.interactor = interactor
    }
}

extension PopularMoviesPresenter: PopularMoviesPresenterInput {
    func fetchMovies() {
        view?.display(loading: true)
        interactor.getPupularMovies { [weak self] result in
            guard let self = self else { return }
            
            self.view?.display(loading: false)
            
            switch result {
            case let .success(movies):
                self.view?.display(movies)
            case let .failure(error):
                self.view?.display(ErrorViewModel(title: "Something went wrong", message: error.localizedDescription))
            }
        }
    }
}
