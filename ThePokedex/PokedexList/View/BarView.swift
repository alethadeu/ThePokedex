//
//  BarView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 13/05/21.
//

import SwiftUI

struct BarView: View {
    var value: Int = 100
    var title: String = "HP"
    var color: Color = .blue

    var body: some View {

        HStack {
            Text(title)
                .padding(.leading, 32)
                .foregroundColor(.gray)
                .frame(width: 100)

            HStack {
                Text("\(value)")
                    .frame(width: 40)
                    .padding(.trailing)

                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 20).animation(.default, value: 1)
                        .foregroundColor(Color(UIColor(red: 0.90, green: 0.90, blue: 0.92, alpha: 1.00)))

                    Capsule()
                        .frame(width: value > 250 ? CGFloat(200) : CGFloat(value), height: 20).animation(.default, value: 1)
                        .foregroundColor(color)
                }
                Spacer()
            }.padding(.leading)
        }
    }
}

struct BarChartView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            BarView(value: pokemon.height, title: "Height", color: .orange)
            BarView(value: pokemon.attack, title: "Attack", color: .red)
            BarView(value: pokemon.defense, title: "Defense", color: .blue)
            BarView(value: pokemon.weight, title: "Weight", color: .purple)
            BarView(value: 100, title: "Total", color: .green)
        }.padding()
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
        BarChartView(pokemon: MOCK_POKEMON[0])
    }
}
