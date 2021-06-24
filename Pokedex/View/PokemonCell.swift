//
//  PokemonCell.swift
//  Pokedex
//
//  Created by DHV on 17/05/2021.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
   
    @EnvironmentObject var model: PokemonModel
    var pokemon: Pokemon
    //let backGround: Color = Color(model.backGroundColor(fortype: pokemon.type)

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .padding(.top,8)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type).font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                                
                        ).frame(width: 100, height: 24)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(model.backGroundColor(fortype: pokemon.type))
        .cornerRadius(12)
        .shadow(color: model.backGroundColor(fortype: pokemon.type), radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
    }
}


