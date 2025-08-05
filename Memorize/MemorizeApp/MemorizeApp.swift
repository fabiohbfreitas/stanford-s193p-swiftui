//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var emojiMemoryGame = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: emojiMemoryGame)
        }
    }
}
