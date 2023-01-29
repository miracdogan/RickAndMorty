//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 20.01.2023.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    func configure(with character: Characters) {
        
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        characterImageView.setImage(with: character.image!)
    }
}

