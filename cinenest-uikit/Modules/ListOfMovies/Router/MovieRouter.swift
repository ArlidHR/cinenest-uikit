//
//  MovieRouter.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 29/09/24.
//

import Foundation
import UIKit

class MovieRouter: MoviesViewWireFrame {
    
    weak var viewController: ListOfMoviesViewController?
    
    static func assembleModule() -> UIViewController {

        let viewController: ListOfMoviesViewController = UIStoryboard(
            name: "ListOfMovies",
            bundle: nil
        ).instantiateInitialViewController() as! ListOfMoviesViewController
        let presenter = MoviePresenter()
        let interactor = MovieInteractor()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}


