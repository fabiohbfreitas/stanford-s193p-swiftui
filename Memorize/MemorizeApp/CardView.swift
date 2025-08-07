//
//  Card.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .fill(.orange)
            .opacity(Constants.TimerShape.shade)
            .scaleEffect(Constants.TimerShape.scaleFactor)
            .overlay {
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fill)
            }
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension CardView {
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 4
        static let backgroundShade: CGFloat = 0.9
        
        struct FontSize {
            static let largest: CGFloat = 64
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        
        struct TimerShape {
            static let shade: CGFloat = 0.4
            static let scaleFactor: CGFloat = 1.0
        }
        
    }
}


#Preview {
    HStack {
        CardView(.init(content: "👻"))
        CardView(.init(content: "👻", isFaceUp: true ))
    }
    .padding()
}
