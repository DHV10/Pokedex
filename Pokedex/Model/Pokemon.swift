//
//  Pokemon.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    
    .init(id: 0, name: "boulasour", imageUrl: "apple" , type:"positon"),
    .init(id: 0, name: "boulasour", imageUrl: "apple" , type:"positon"),
    .init(id: 0, name: "boulasour", imageUrl: "apple" , type:"positon")
    
    
]

