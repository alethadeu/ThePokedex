//
//  PokedexHeaderView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 20/05/21.
//

import SwiftUI

struct PokedexHeaderView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Pokédex")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding(.leading, 12)
                
                SearchBar(text: .constant(""))
                Text("The Pokedex contains detailed stats for every creature from the Pokémon games")
                    .font(.body)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
            }.background(
                Image("pokeballLogo")
                    .renderingMode(.template)
                    .resizable(resizingMode: .tile)
                    .frame(width: 400, height: 400)
                    .padding(.trailing, -200)
                    .padding(.top, 100)
                    .rotationEffect(Angle(degrees: -30))
                    .foregroundColor(.gray.opacity(0.08))
            )
        }
        
    }
}

struct PokedexHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexHeaderView()
    }
}
