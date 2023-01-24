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
    
    func configure(with character: Characters) {
        
        nameLabel.text = character.name
        characterImageView.setImage(with: character.image!)
    }
}
 
