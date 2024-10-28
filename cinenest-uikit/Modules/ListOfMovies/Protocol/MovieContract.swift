//
//  MovieContract.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 29/09/24.
//

import Foundation

import Foundation

protocol MoviesViewBusinessLogic {
    func getMovies()
}

protocol MoviesViewPresentationLogic {
    func presentServiceError()
    func presentListMovies(movies: [MovieEntity])
}

protocol MoviesViewDisplayLogic {
    func displayListMovies(viewModel: [MovieEntity])
    func displayListEmptyMovies(text: String, sizeTitle: CGFloat)
}

protocol MoviesViewWireFrame: AnyObject {
}


