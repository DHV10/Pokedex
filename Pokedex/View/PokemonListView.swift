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
    
    private var title: String {
        if model.selectetedType == nil || model.selectetedType == Constants.defaultList {
            return "POKEMON"
        }else {
            return model.selectetedType!.uppercased()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text(title)
                        .bold()
                        .padding(.leading, 20)
                        .padding(.top, 40)
                      // .font(.title)
                        .font(Font.custom("Avenir Heavy", size: 35))
                    
                    LazyVGrid(columns: gridsItems, spacing: 16){
                        ForEach(model.pokemons){ pokemon in
                            if model.selectetedType == nil || model.selectetedType == Constants.defaultList || model.selectetedType != nil && pokemon.type == model.selectetedType {
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    PokemonCell(pokemon: pokemon)
                                }
                            }
                            
                           
                          
                        }
                    }
                }
               
            }
            .navigationBarHidden(true)
        }
    }
}
