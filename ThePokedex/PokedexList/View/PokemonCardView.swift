//
//  PokemonCardView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 19/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonCardView: View {
    var pokemon: Pokemon
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                WebImage(url: pokemon.photoURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.leading, 6)
                    .matchedGeometryEffect(id: "image_\(pokemon.id)", in: animation)
                
                
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(pokemon.type.capitalized)
                        .font(.body)
                        .foregroundColor(.white)
                        .fontWeight(.light)
                    
                }.padding(.top, 8)
                Spacer()
                Text(pokemon.pokedexNumber)
                    .font(.system(size: 25))
                    .foregroundColor(.white.opacity(0.6))
                    .fontWeight(.bold)
                    .offset(y: 75)
            }
        }.background(
            Color(pokemon.colorType).overlay(Color.white.opacity(0.5))
                .matchedGeometryEffect(id: "bg_\(pokemon.id)", in: animation)

        )
        .cornerRadius(12)
        .shadow(radius: 5)
        .frame(height: 110)

    }
}

struct PokemonCardView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        PokemonCardView(pokemon: MOCK_POKEMON[0], animation: animation)
        
    }
}
