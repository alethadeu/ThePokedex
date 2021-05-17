//
//  PokedexView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexView: View {
    @ObservedObject var viewModel = PokedexViewViewModel()
    @Namespace var animation
    var body: some View {
        ZStack {
            ScrollView {
                PokedexGrid(pokemons: viewModel.pokemons, animation: animation)
                    .environmentObject(viewModel)
            }
            
            if viewModel.show {
                PokemonDetailView(pokemon: viewModel.selectPokemon, animation: animation)
                    .environmentObject(viewModel)
            }
        }.onAppear {
            self.viewModel.fetchPokemons()
        }.padding(.vertical)
        .background(Color.white)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
