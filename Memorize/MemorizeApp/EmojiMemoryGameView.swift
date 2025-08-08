//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @Bindable var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            HStack {
                score
                Spacer()
                shuffle
            }
            .padding()
            
        }
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .bold()
            .font(.title2)
            .monospaced()
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button {
            withAnimation {
                viewModel.shuffle()
            }
        } label: {
            Image(systemName: "shuffle")
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ?  100 :0)
                .onTapGesture {
                    choose(card)
                }
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation(.easeOut(duration: 0.3)) {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id.uuidString)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id.uuidString == id ? amount : 0
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
