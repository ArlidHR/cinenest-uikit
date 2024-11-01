//
//  MovieInteractor.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 29/09/24.
//

import Foundation

class MovieInteractor: MoviesViewBusinessLogic {

    var listMovies: [MovieEntity] = []
    var presenter: MoviesViewPresentationLogic?

    func getMovies() {
        let networkManager = HttpRequests()
        let url = Constants.URL.main + Constants.Endpoints.items

        networkManager.request(method: .get, url: url, parameters: nil) { result in
            guard let presenter = self.presenter else { return }
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(MovieResponseEntity.self, from: data)
                    self.listMovies = response.results
                    presenter.presentListMovies(movies: self.listMovies)
                } catch {
                    print("Error al decodificar la respuesta: \(error)")
                    presenter.presentServiceError()
                }
            case .failure(let error):
                presenter.presentServiceError()
                print("Error en la petición: \(error)")
            }
        }
    }
}


