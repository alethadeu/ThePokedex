//
//  SearchBar.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 20/05/21.
//

import SwiftUI
 
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search for a Pokémon", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(.lightGray.withAlphaComponent(0.2)))
                .cornerRadius(16)
                .padding(.horizontal, 10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                              .foregroundColor(.gray)
                              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                              .padding(.leading, 16)
                    }
                )
                .foregroundColor(.gray)
            
            Image(systemName: "slider.horizontal.3")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
                .padding([.trailing, .leading], 8)
            
        }
    }
}
struct SearchBar_Previews: PreviewProvider {

    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
