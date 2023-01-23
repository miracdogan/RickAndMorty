//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 20.01.2023.
//

import Foundation


struct CharacterResponse: Decodable {
    
    //let info: String?
    let results: [Characters]?
}

struct Characters: Decodable {
    let id: Int?
    let name: String?
    let image: URL?
}
