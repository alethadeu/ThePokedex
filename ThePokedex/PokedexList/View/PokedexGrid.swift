//
//  PokedexGrid.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexGrid: View {
    var pokemons: [Pokemon]
    var clickOnCell: (_ pokemon: Pokemon) -> Void
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 16){
            ForEach(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon) { pokemon in
                    clickOnCell(pokemon)
                }
            }
        }.padding([.leading, .trailing], 8)
    }
}

struct PokedexGrid_Previews: PreviewProvider {
    static var previews: some View {
        PokedexGrid(pokemons: MOCK_POKEMON) { pokemon in
            print(pokemon.name)
        }
    }
}
