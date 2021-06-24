//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by DHV on 24/06/2021.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @EnvironmentObject var model: PokemonModel
    var pokemon: Pokemon
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding([.bottom, .trailing], 4)
                
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading)
                        .font(Font.custom("Avenir Heavy", size: 35))
                        .foregroundColor(model.backGroundColor(fortype: pokemon.type))
                }
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(model.backGroundColor(fortype: pokemon.type))
                        .frame(width: 400, height: 400, alignment: .center)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Information")
                            .font(Font.custom("Avenir ", size: 22))
                            .padding(.bottom ,5 )
                        Text("Attack: "+String(pokemon.attack)+" points")
                        Text("Defense: "+String(pokemon.defense)+" points")
                        Text("Height: "+String(pokemon.height)+" inches")
                        Text("Weight: "+String(pokemon.weight)+" grams")
                        Text("Type: "+String(pokemon.type))
                        Text("Description ")
                            .font(Font.custom("Avenir ", size: 22))
                            .padding(.top ,15 )
                        Text(String(pokemon.description))
                    }
                    .padding()
                    
                }
                .font(Font.custom("Avenir ", size: 15))
                .foregroundColor(.white)
                .padding()
            }
            
        }
    }
}


