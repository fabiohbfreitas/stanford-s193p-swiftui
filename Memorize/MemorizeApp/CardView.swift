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
        let baseShape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        ZStack {
            Group {
                baseShape
                    .foregroundStyle(.white.gradient)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: Constants.lineWidth))
                    .foregroundStyle(.orange)
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
            }
            .opacity(card.isFaceUp ? 1 : 0)
            Group {
                baseShape
                    .opacity(Constants.backgroundShade)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: Constants.lineWidth))
            }
            .foregroundStyle(.orange.gradient)
            .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension CardView {
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        static let backgroundShade: CGFloat = 0.9
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        
        struct TimerShape {
            static let shade: CGFloat = 0.4
            static let scaleFactor: CGFloat = 0.8
        }
        
    }
}


#Preview {
    VStack {
        CardView(.init(content: "👻"))
        CardView(.init(content: "👻", isFaceUp: true ))
    }
    .padding()
}
