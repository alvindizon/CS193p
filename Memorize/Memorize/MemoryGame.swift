//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Alvin Dizon on 7/28/24.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{

    private(set) var cards: Array<Card>

    init(pairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add pairsOfCards x 2 cards
        for pairIndex in 0..<max(2, pairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    // need this to be optional so that initializer can return with all properties initialized
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            // filter items that are face up
            cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set {
            return cards.indices.forEach { cards[$0].isFaceUp = ( newValue == $0) }
        }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }

        }
    }

    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {


        // No need since all vars are Equatable
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }

        var isFaceUp = true
        var isMatched = false
        let content: CardContent

        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
