//
//  PokedexViewViewModel.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import SwiftUI

class PokedexViewViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()

}
