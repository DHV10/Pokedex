//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import Foundation
import SwiftUI

class PokemonModel: ObservableObject {
    
    @Published var pokemons = [Pokemon]()
 
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        }.resume()
    }
    
    func backGroundColor(fortype type: String) -> Color {
        switch type {
        case "fire":
            return Color.red
        case "poison":
            return Color.green
        case "water":
            return Color.blue
        case "electric":
            return Color.yellow
        case "psychic":
            return Color.purple
        case "normal":
            return Color.orange
        case "ground":
            return Color.gray
        case "flying":
            return Color(red: 0.4627, green: 0.8392, blue: 1.0)
        case "fairy":
            return Color.pink
        default:
            return Color( red: 50/255, green: 200/255, blue: 200/255)
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data 
    }
}
