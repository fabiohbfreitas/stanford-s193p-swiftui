//
//  Card.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let baseShape = RoundedRectangle(cornerRadius: 12.0)
        ZStack {
            Group {
                baseShape
                    .foregroundStyle(.white.gradient)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: 6))
                    .foregroundStyle(.orange)
                Text(card.content)
                    .font(.system(size: 64))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fill)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            Group {
                baseShape
                    .opacity(0.9)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: 6))
            }
            .foregroundStyle(.orange.gradient)
            .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    VStack {
        CardView(.init(content: "👻"))
    }
    .padding()
}
