//
//  Result.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 11/05/21.
//

import Foundation


enum Result<T, U> {
    case success(payload: T)
    case failure(error: U)
}
