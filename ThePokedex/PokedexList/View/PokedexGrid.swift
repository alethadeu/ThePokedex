//
//  PokedexGrid.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexGrid: View {
    var pokemons: [Pokemon]
    @EnvironmentObject var viewModel: PokedexViewViewModel
    var animation: Namespace.ID
    //var clickOnCell: (_ pokemon: Pokemon) -> Void
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
    
        LazyVGrid(columns: gridItems, spacing: 16){
            ForEach(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon, animation: animation)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            viewModel.selectPokemon = pokemon
                            viewModel.show = true
                        }
                    }
            }
        }.padding([.leading, .trailing], 8)
        

    }
}

//struct PokedexGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexGrid(pokemons: MOCK_POKEMON)
//    }
//}
