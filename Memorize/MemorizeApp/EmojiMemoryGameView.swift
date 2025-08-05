//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @Bindable var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button {
                viewModel.shuffle()
            } label: {
                Image(systemName: "shuffle")
            }

        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { idx in
                CardView(viewModel.cards[idx])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
    }
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
