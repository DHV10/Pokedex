//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by DHV on 24/06/2021.
//

import SwiftUI

struct PokemonTypeView: View {
    @EnvironmentObject var model: PokemonModel
    @Binding var selectedTad: Int
    var body: some View {
        VStack(alignment: .leading){
            Text("POKEMON")
                .bold()
                .padding(.leading, 20)
                .padding(.top, 40)
              // .font(.title)
                .font(Font.custom("Avenir Heavy", size: 35))
                
            
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        
                        ForEach(Array(model.types), id: \.self) { type in
                            
                            Button {
                                selectedTad = Constants.listTab
                                model.selectetedType = type
                            } label: {
                                VStack {
                                    Image(type.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width-20)/3, height: (geo.size.width-20)/3)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(type)
                                        .foregroundColor(model.backGroundColor(fortype: type))
                                }
                            }

                            
                        }
                        
                    }
                    
                }
                
                
            }
            .padding(.horizontal)
        }
        
    }
}

