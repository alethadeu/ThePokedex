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
                PokedexHeaderView()
                list.padding(.horizontal)
            }
            
            if viewModel.show {
                PokedexDetailV2(pokemon: viewModel.selectPokemon, evolutions: viewModel.loadEvolutionForSelectPokemon(), animation: animation)
                    .environmentObject(viewModel)
            }
            
        }.onAppear {
            self.viewModel.fetchPokemons()
        }
        .background(Color(.white).edgesIgnoringSafeArea(.all))
    }
    
    
    var list: some View {
        ForEach(viewModel.pokemons) { pokemon in
            PokemonCardView(pokemon: pokemon, animation: animation)
                .padding(.horizontal, 8)
                .onTapGesture {
                    withAnimation(.spring()) {
                        viewModel.selectPokemon = pokemon
                        viewModel.show = true
                    }
                }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
            .preferredColorScheme(.dark)
    }
}
