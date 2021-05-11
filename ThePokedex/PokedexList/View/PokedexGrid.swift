//
//  PokedexGrid.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexGrid: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 16){
            ForEach(0..<151) { _ in
                PokemonCell(pokemon: MOCK_POKEMON[0])
            }
        }
    }
}

struct PokedexGrid_Previews: PreviewProvider {
    static var previews: some View {
        PokedexGrid()
    }
}
