//
//  ContentView.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Card(isFaceUP: false)
            Card(isFaceUP: true)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
