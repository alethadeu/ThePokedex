//
//  PokemonCell.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    var clickOnCell: (_ pokemon: Pokemon) -> Void

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    VStack(spacing: 15) {
                        TypeChips(text: pokemon.type.capitalized)
                    }
                    WebImage(url: pokemon.photoURL)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(Color(pokemon.colorType))
        .cornerRadius(12)
        .onTapGesture {
            self.clickOnCell(pokemon)
        }
    }
}



struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonCell(pokemon: MOCK_POKEMON[0]) { pokemon in
                print(pokemon.name)
            }
        }
    }
}
