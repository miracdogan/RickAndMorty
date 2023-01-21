//
//  Service.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 20.01.2023.
//

import Foundation

struct Service {
    
    func getCharacters(completionHandler: @escaping (_ characters: [Characters]) -> Void) {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
                
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            let decoder = JSONDecoder()
            
            let characterResponse = try! decoder.decode(CharacterResponse.self, from: data!)
            completionHandler(characterResponse.results ?? [])
            
        }.resume()
    }
    
    func getCharactersDetails(characterId: Int, completionHandler: @escaping (_ characters: Characters) -> Void) {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character/\(characterId)")!
                
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            let decoder = JSONDecoder()
            
            let characterDetailsResponse = try! decoder.decode(CharacterDetailsResponse.self, from: data!)
            completionHandler(characterDetailsResponse.results!)
            
        }.resume()
    }
}
