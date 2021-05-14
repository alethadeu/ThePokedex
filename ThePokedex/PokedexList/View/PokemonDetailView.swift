//
//  PokemonDetailView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 13/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(pokemon.colorType), .white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            Color.white.offset(y: 300)
            
            ScrollView {
                WebImage(url: pokemon.photoURL)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                VStack {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .padding(.top, 40)
                        .foregroundColor(.black)
                      
                    
                    Text(pokemon.type.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(Color(pokemon.colorType))
                        .cornerRadius(20)
                    
                    Text(pokemon.description)
                        .padding(.horizontal)
                        .padding(.top, 12)
                        .foregroundColor(.black)
                    
                    HStack { Spacer() }
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding([.top], 0.0)
                .padding(.horizontal)
                .zIndex(-1)
                
                HStack {
                    Text("Stats")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.black)
                    Spacer()
                }
                
                BarChartView(pokemon: pokemon)
                    .padding(.trailing)
                    .padding(.top, 0)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonDetailView(pokemon: MOCK_POKEMON[0])
            PokemonDetailView(pokemon: MOCK_POKEMON[0])
        }
    }
}
