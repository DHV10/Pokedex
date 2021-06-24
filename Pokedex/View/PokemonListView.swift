//
//  PokedexView.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import SwiftUI


struct PokemonListView: View {
    
    @EnvironmentObject var model: PokemonModel
    
    private let gridsItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridsItems, spacing: 16){
                    ForEach(model.pokemons){ pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCell(pokemon: pokemon)
                        }
                      
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}
