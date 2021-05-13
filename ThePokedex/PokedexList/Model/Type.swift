//
//  Type.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation
import UIKit

enum Type: String, Codable {
    case normal = "normal"
    case fighting = "fighting"
    case flying = "flying"
    case posion = "poison"
    case ground = "ground"
    case rock = "rock"
    case bug = "bug"
    case ghost = "ghost"
    case steel = "steel"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case psychic = "psychic"
    case ice = "ice"
    case dragon = "dragon"
    case dark = "dark"
    case fairy = "fairy"
    
    var name: String {
        return self.rawValue.capitalized
    }
    
    var color: UIColor? {
        let typeValue = self.rawValue.capitalized
        let colorString = "color\(typeValue)"
        return UIColor(named: colorString)
    }
}
