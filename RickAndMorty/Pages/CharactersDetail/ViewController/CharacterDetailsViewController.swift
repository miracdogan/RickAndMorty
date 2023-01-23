//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 21.01.2023.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let characterId: Int
    
    private var character: Characters?
    
    init(characterId: Int) {
        self.characterId = characterId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCharacterDetails()
    }
    
    private func fetchCharacterDetails() {
        
        let service = Service()
        
        service.getCharactersDetails(characterId: characterId) { character in
            
            DispatchQueue.main.async {
                
                self.character = character
                
                //self.imageView.setImage(with: character.image!)
                self.nameLabel.text = character.name
            }
        }
    }
}
