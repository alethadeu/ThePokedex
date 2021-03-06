//
//  PokedexDetailV2.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 20/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokedexDetailV2: View {
    var pokemon: Pokemon
    var evolutions: [Pokemon]
    var animation: Namespace.ID
    
    @EnvironmentObject var viewModel: PokedexViewViewModel
    
    @State var showStats = true
    @State var showAbout = false
    @State var showEvolution = false
    
    var body: some View {
        ScrollView {
            header
            VStack {
                sectionSelection
                    .padding(.top, 20)
                if showAbout {
                    aboutSection
                } else if showStats {
                    statsSection
                } else if showEvolution {
                    evolutionSection
                }
            }
        }
        .background(Color(.white))
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    var header: some View {
        ZStack {
            VStack {
                Spacer(minLength: 45)
                VStack(alignment: .leading) {
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.show = false
                        }
                    }
                    ) {
                        Image(systemName: "arrow.backward")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(pokemon.pokedexNumber)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .font(.headline)
                    
                        Text(pokemon.name.capitalized)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.title)
                    
                        Text(pokemon.type.capitalized)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }.padding(.leading, 32)
                    .padding(.top, 12)
                
                    HStack {
                        Spacer()
                        WebImage(url: pokemon.photoURL)
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                            .matchedGeometryEffect(id: "image_\(pokemon.id)", in: animation)
                        Spacer()
                    }
                }.padding()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)

        }
        .background(
            Circle()
                .fill(Color(pokemon.colorType))
                .overlay(Color.white.opacity(0.5))
                .scaleEffect(2)
                .offset(y: -getRect().height / 4.5)
                .matchedGeometryEffect(id: "bg_\(pokemon.id)", in: animation)
                .overlay(
                    Image("pokeballLogo")
                        .renderingMode(.template)
                        .resizable(resizingMode: .tile)
                        .frame(width: 400, height: 400)
                        .padding(.leading, 100)
                        .padding(.top, -200)
                        .rotationEffect(Angle(degrees: -30))
                        .foregroundColor(.white.opacity(0.08))
                )
    )
        
    }
    
    var sectionSelection: some View {
        HStack(alignment: .center) {
            Text("About")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(showAbout ? Color.red : Color.gray)
                .padding(.vertical, 5)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(radius: 1.5)
                )
                .onTapGesture {
                    showAbout = true
                    showStats = false
                    showEvolution = false
                }
            Spacer()
            Text("Stats")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(showStats ? Color.red : Color.gray)
                .padding(.vertical, 5)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(radius: 1.5)
                )
                .onTapGesture {
                    showAbout = false
                    showStats = true
                    showEvolution = false
                }
            Spacer()
            Text("Evolution")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(showEvolution ? Color.red : Color.gray)
                .padding(.vertical, 5)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(radius: 1.5)
                )
                .onTapGesture {
                    showAbout = false
                    showStats = false
                    showEvolution = true
                }
        }.padding(.horizontal, 40)
    }
    
    var aboutSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About")
                .font(.title2)
                .bold()
                .foregroundColor(.red)
            Text(pokemon.description)
                .font(.body)
                .foregroundColor(.gray)
                .bold()
        }.padding(.all)
    }
    
    var statsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Stats")
                .font(.title2)
                .bold()
                .foregroundColor(.red)
                .padding(.leading, 10)
                
           BarChartView(pokemon: pokemon)
            .padding( [.leading, .trailing], -50)
        }
        .padding(.all)
    }
    
    var evolutionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Evolution")
                .font(.title2)
                .bold()
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                ForEach(evolutions) { evolution in
                    let index = evolutions.firstIndex(where: { $0.name == evolution.name })
                    
                    if index == 0 && evolution.name != pokemon.name {
                        HStack(alignment: .center, spacing: 10) {
                            WebImage(url: pokemon.photoURL)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                           Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 2)
                            .cornerRadius(10)
                            .padding(4)
                            WebImage(url: evolution.photoURL)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                        }.padding(.horizontal, 32)
                    }
                    
                    if index == 1 {
                        HStack(alignment: .center, spacing: 10) {
                            WebImage(url: evolutions[0].photoURL)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                           Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 2)
                            .cornerRadius(10)
                            .padding(4)
                            WebImage(url: evolution.photoURL)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                        }.padding(.horizontal, 32)
                    }
                }
            }
        }
        .padding(.all)
    }
}

struct PokedexDetailV2_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        PokedexDetailV2(pokemon: MOCK_POKEMON[0], evolutions: [MOCK_POKEMON[1], MOCK_POKEMON[1]], animation: animation)
    }
}

func getRect() -> CGRect {
    return UIScreen.main.bounds
}

