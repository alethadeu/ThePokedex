//
//  PokemonCell.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI
import URLImage

struct PokemonCell: View {
    let pokemon: Pokemon
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
                        ForEach(pokemon.type, id: \.self) { type in
                            TypeChips(text: type.rawValue)
                        }
                    }
                    URLImage(pokemon.photoURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .padding([.bottom, .trailing], 4)
                    }
                }
            }
        }
        .background(Color.green)
        .cornerRadius(12)
    }
}



struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonCell(pokemon: MOCK_POKEMON[0])
        }
    }
}
