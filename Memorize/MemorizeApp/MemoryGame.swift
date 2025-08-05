//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2,numberOfPairOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func choose(_ chosenCard: Card) {
        guard let idx = index(of: chosenCard) else { return }
        cards[idx].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int? {
        guard let idx = cards.firstIndex(of: card) else { return nil }
        return idx
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        let id = UUID()
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        var debugDescription: String {
            "Id(\(id.uuidString)) Card: \(content), isFaceUp: \(isFaceUp), isMatched: \(isMatched)"
        }
    }
}
