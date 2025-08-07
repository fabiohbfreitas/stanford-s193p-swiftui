//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

@Observable
class EmojiMemoryGame {
    typealias EmojiGame = MemoryGame<String>
    
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "🧟‍♂️" ]
    
    private static func createMemoryGame() -> EmojiGame {
        return EmojiGame(
            numberOfPairOfCards: 2,
            cardContentFactory: { pairIndex in
                guard emojis.indices.contains(pairIndex) else {
                    return "❗"
                }
                return emojis[pairIndex]
            }
        )
    }
    
    private var model = createMemoryGame()

    var cards: [EmojiGame.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: EmojiGame.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
