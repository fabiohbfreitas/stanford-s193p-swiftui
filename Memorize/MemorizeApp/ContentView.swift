//
//  ContentView.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["👻", "🎃", "🕷️", "😈"]
        HStack {
            ForEach(emojis.indices, id: \.self) { emoji in
                Card(emoji: emojis[emoji], isFaceUP: .random())
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
