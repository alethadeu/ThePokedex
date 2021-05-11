//
//  TypeChips.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import SwiftUI

struct TypeChips: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.25))
            )
            .frame(width: 100, height: 24)
    }
}

struct TypeChips_Previews: PreviewProvider {
    static var previews: some View {
        TypeChips(text: "Grass")
            .background(Color.green)
            .cornerRadius(12)
            .frame(width: 100, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
