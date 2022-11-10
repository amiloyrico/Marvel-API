//
//  MarvelServices.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 8/11/22.
//

import Foundation
class MarvelService {
    
    func getCharacters(completion: @escaping (Result<Character,NetworkError>) -> Void){
        
        //guard let valida que se pueda convertir un string en un objeto de tipo URL
        guard let url = URL(string: urlCategories) else {
            return completion(.failure(.badURL))
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
        
            
            guard  let characters = try? JSONDecoder().decode(Character.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(characters))
            
           // print(characters)
            
        }.resume()
        
    }
    
    func getCharacterXId(completion: @escaping (Result<Character,NetworkError>) -> Void){
        guard let url = URL(string: urlCharacterId) else{
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let characters = try? JSONDecoder().decode(Character.self, from: data)else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(characters))
            //print(character)
            
            
        }.resume()
    }
    
    func getEvents(completion: @escaping (Result<EventsComics,NetworkError>) -> Void){
        guard let url = URL(string: urlEvents) else{
            return completion(.failure(.badURL))
            
        
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            
            guard let events = try? JSONDecoder().decode(EventsComics.self, from: data)else{
                return completion(.failure(.decodingError))
                
            }
            
            completion(.success(events))
            
        }.resume()
    }
    
}
