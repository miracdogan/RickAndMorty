//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 19.01.2023.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var characters: [Characters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        fetchCharacters()
        
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "CharacterTableViewCell", bundle: Bundle(for: CharacterTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
    private func fetchCharacters() {
        
        let service = Service()
        service.getCharacters { characters in
            self.characters = characters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let characterId = characters[indexPath.row].id!
        let characterDetailsViewController = CharacterDetailsViewController(characterId: characterId)
        
        self.navigationController?.pushViewController(characterDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0;
    }
}
