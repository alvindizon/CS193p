//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Alvin Dizon on 7/28/24.
//

import Foundation


struct MemoryGame<CardContent> {

    private(set) var cards: Array<Card>

    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add pairsOfCards x 2 cards
        for pairIndex in 0..<max(2, pairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(_ card: Card) {

    }

    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    struct Card {
        var isFaceUp =  true
        var isMatched = false
        let content: CardContent
    }
}
