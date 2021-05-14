//
//  NavigationLazyView.swift
//  ThePokedex
//
//  Created by Alexandre Thadeu  on 13/05/21.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
