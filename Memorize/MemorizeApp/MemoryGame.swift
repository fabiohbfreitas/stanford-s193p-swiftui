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
    
    
    var indexOfFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).only }
        set { cards.indices.forEach({ cards[$0].isFaceUp = $0 == newValue }) }
    }
    
    mutating func choose(_ chosenCard: Card) {
        guard let chosenIndex = index(of: chosenCard),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else { return }
        
        if let potentialMatchIndex = indexOfFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
        } else {
            indexOfFaceUpCard = chosenIndex
        }
        cards[chosenIndex].isFaceUp = true
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

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
