//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Alvin Dizon on 7/28/24.
//

import Foundation


struct MemoryGame<CardContent> {

    var cards: Array<Card>

    func choose(card: Card) {

    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
