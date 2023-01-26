//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 19.01.2023.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            let nib = UINib(nibName: "CharacterTableViewCell", bundle: Bundle(for: CharacterTableViewCell.self))
            tableView.register(nib, forCellReuseIdentifier: "CharacterTableViewCell")
        }
    }
    var characters: [Characters] = []
    var spinner = UIActivityIndicatorView()
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        self.spinner.startAnimating()
        service.getCharacters {[weak self] characters in
            guard let self else { return }
            self.stopAnimation()
            DispatchQueue.main.async {
                self.characters.append(contentsOf: characters)
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
    
    func createSpinnerFooter()  -> UIView {
        let footerView = UIView(frame:  CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            fetchCharacters()
        }
    }
    
    
    private func stopAnimation() {
//        self.spinner.stopAnimating()
    }
}
