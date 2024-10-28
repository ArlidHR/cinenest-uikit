//
//  ListOfMoviesViewController.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 27/09/24.
//

import Foundation
import UIKit

class ListOfMoviesViewController: UIViewController {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var movieTableView: UITableView!
    
    // MARK: - Internal Properties -
    var listMovies: [MovieEntity] = []
    var interactor: MoviesViewBusinessLogic?

    // MARK: - LyfeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getMovies()
        registerTableview()
    }
    
    private func registerTableview() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
}

//  MARK: - MoviesViewDisplayLogic -
extension ListOfMoviesViewController: MoviesViewDisplayLogic {
    func displayListMovies(viewModel: [MovieEntity]) {
        listMovies.removeAll()
        listMovies =  viewModel
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
            self.movieTableView.restore()
        }
    }
    
    func displayListEmptyMovies(text: String, sizeTitle: CGFloat) {
        listMovies.removeAll()
        DispatchQueue.main.async {
            self.movieTableView.setEmptyMessage(text, size: sizeTitle)
            self.movieTableView.reloadData()
        }
    }
}

//  MARK: - UITableViewDataSource,UITableViewDelegate -
extension ListOfMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configureView(listMovies[indexPath.row])
        return cell
    }
}
