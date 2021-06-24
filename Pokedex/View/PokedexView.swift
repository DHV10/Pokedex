//
//  PokedexView.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import SwiftUI


struct PokedexView: View {
    
    @EnvironmentObject var model : PokemonModel
    
    private let gridsItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridsItems, spacing: 16){
                    ForEach(model.pokemons){ pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}
