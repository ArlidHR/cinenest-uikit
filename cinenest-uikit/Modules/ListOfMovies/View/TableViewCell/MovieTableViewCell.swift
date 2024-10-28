//
//  MovieTableViewCell.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 27/09/24.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    // MARK: - Internal Properties -
    static let identifier = "cellMovies"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Internal Functions -
    func configureView(_ viewmodel: MovieEntity) {
        posterImage.kf.setImage(with: viewmodel.imageURL)
        nameLabel.text = viewmodel.title
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            voteLabel.text = numberFormatter.string(from: NSNumber(value: viewmodel.votes))
    }
}


