//
//  Pokemon.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var imageUrl: String
    var type: String
    
    var attack: Int
    var defense: Int
    var description: String
    var evolutionChain:[Evolution]?
    var height: Int
    var weight: Int
    
}

struct Evolution : Decodable , Identifiable {
    var id: String
    var name: String
}

