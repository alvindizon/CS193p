//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alvin Dizon on 7/28/24.
//

import SwiftUI

// This is the ViewModel- which acts like a gatekeeper between View and the Model
class EmojiMemoryGame: ObservableObject {
    // this is a type variable
    private static let emojis = [ "👻", "🎃", "🕷️","😈", "😈", "👻", "🎃", "🕷️","😈", "🏩", "🧨", "🍭"]

    // mark this so that we know that it is changed
    @Published private var model = createMemoryGame()
    // this is a type function
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(pairsOfCards: 5) { index in
            if emojis.indices.contains(index) {
                // the real name is EmojiMemoryGame.emojis
                return emojis[index]
            } else {
                return "⁉️"
            }
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
