//
//  ContentView.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "🧟‍♂️" ]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            footer
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { emoji in
                CardView(emoji: emojis[emoji], isFaceUP: .random())
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundStyle(.orange.gradient)
        }
    }
    
    @ViewBuilder
    func cardCountAdjuster(by offset: CardOffset, symbol: String) -> some View {
        Button {
            switch offset {
            case .add:
                guard cardCount < emojis.count else { return }
            case .remove:
                guard cardCount > 1 else { return }
            }
            
            cardCount += offset.rawValue
        } label: {
            Image(systemName: symbol)
        }
        .foregroundStyle(offset.rawValue > 0 ? .blue : .red)
        .disabled(cardCount + offset.rawValue < 1 || cardCount + offset.rawValue > emojis.count)
    }
    
    var addCard: some View {
        cardCountAdjuster(by: .add, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var removeCard: some View {
        cardCountAdjuster(by: .remove, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    enum CardOffset: Int {
        case add = 1
        case remove = -1
    }
    
    var footer: some View {
        HStack {
            addCard
            Spacer()
            removeCard
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
