//
//  PokemonTabView.swift
//  Pokedex
//
//  Created by DHV on 24/06/2021.
//

import SwiftUI

struct PokemonTabView: View {
    @EnvironmentObject var model: PokemonModel
    @State var selectedTab = Constants.favouriteTab
    var body: some View {
        TabView(selection: $selectedTab) {
            PokemonFavouriteView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Favourite")
                    }
                }
                .tag(Constants.favouriteTab)
            PokemonTypeView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Type")
                    }
                }
                .tag(Constants.typeTab)
            PokemonListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
    }
}


