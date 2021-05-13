//
//  PokedexView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexView: View {
    @ObservedObject var viewModel = PokedexViewViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                PokedexGrid(pokemons: viewModel.pokemons) { pokemon in
                    print(pokemon.type)
                }
            }
            .navigationBarTitle(Text("Kanto Pokedex"))
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
