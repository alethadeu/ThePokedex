//
//  PokedexView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct PokedexView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                PokedexGrid()
            }
        }.navigationTitle("Pokedex")
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
