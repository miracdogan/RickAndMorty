//
//  Service.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 20.01.2023.
//

import Foundation

struct Service {
    
    func getCharacters(pagination:Bool = false, completionHandler: @escaping (_ characters: [Characters]) -> Void) {
        
        let pageNumber = 1
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(pageNumber)")!
                
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            let decoder = JSONDecoder()
            
            let characterResponse = try! decoder.decode(CharacterResponse.self, from: data!)
            completionHandler(characterResponse.results ?? [])
            
        }.resume()
    }
    
    func getCharactersDetails(characterId: Int, completionHandler: @escaping (_ result: Result<Characters, Error>) -> Void) {
                // URL KONTROL›Buras
                guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(characterId)") else {
                    completionHandler(.failure("URL_OLUSTURULURKEN_HATA_MESAJI" as! Error))
                    return
                }

                URLSession.shared.dataTask(with: url) { data, _, error in

                    // SISTEM TARAFINDAN GONDERILEN HATA KONTROLU. INTERNETINIZ YOK VS
                    guard error == nil else {
                        completionHandler(.failure(error!))
                        return
                    }

                    // NETWORK REQUEST BASARILI FAKAT DATA BOS
                    guard let data else {
                        completionHandler(.failure("DATA_BOS_MESAJI" as! Error))
                        return
                    }

                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(Characters.self, from: data)
                        completionHandler(.success(response))
                    } catch {
                        // GELEN DATAYI PARSE(decode) EDERKEN GELEN HATA
                        completionHandler(.failure(error))
                    }

                }.resume()
            }
}
