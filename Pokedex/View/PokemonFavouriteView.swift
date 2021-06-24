//
//  PokemonFavouriteView.swift
//  Pokedex
//
//  Created by DHV on 24/06/2021.
//

import SwiftUI
import Kingfisher

struct PokemonFavouriteView: View {
    @EnvironmentObject var model: PokemonModel
    @State var isShow = false
    @State var selectedTabIndex = 0
    var body: some View {
        VStack(alignment: .leading , spacing: 0) {
            Text("FAVOURITE ")
                .bold()
                .padding(.leading )
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 35))
            
            GeometryReader {geo in
                TabView(selection: $selectedTabIndex) {
                    ForEach(0..<model.pokemons.count, id: \.self) { index in
                        if model.pokemons[index].attack >= 90 && model.pokemons[index].defense >= 90 {
                            Button(action: {
                                self.isShow = true
                            }, label : {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(model.backGroundColor(fortype: model.pokemons[index].type))
                                    VStack {
                                        KFImage(URL(string: model.pokemons[index].imageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .clipped()
                                        Text(model.pokemons[index].name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 25))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                            })
                            .tag(index)
                            
                            .sheet(isPresented: $isShow, content: {
                                PokemonDetailView(pokemon: model.pokemons[index])
                               // RecipeDetailView(recipe : model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 10)
                            
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        //find the index of first recipe that is featured
        let index = model.pokemons.firstIndex { (pokemon ) -> Bool in
            return pokemon.attack >= 90 
        }
        
        selectedTabIndex = index ?? 0
    }
}

