//
//  PopularMoviesViewController.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import UIKit

class PopularMoviesViewController: UITableViewController {

    var movies: [MovieViewModel] = []
    var presenter: PopularMoviesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchMovies()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.titleLabel.text = movies[indexPath.row].title
        cell.overviewLabel.text = movies[indexPath.row].overview
        return cell
    }
    
    @IBAction func onRefresh(_ sender: Any) {
        presenter.fetchMovies()
    }
}

extension PopularMoviesViewController: PopularMoviesView {
    func display(_ movies: [MovieViewModel]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func display(_ error: ErrorViewModel) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Accept", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    func display(loading: Bool) {
        if loading {
            refreshControl?.beginRefreshing()
        } else {
            refreshControl?.endRefreshing()
        }
    }
}
