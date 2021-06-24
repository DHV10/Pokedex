//
//  PokedexApp.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            PokedexListView()
                .environmentObject(PokemonModel())
        }
    }
}
