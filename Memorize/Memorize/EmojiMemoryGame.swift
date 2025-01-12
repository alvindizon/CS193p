//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alvin Dizon on 7/28/24.
//

import SwiftUI

// This is the ViewModel- which acts like a gatekeeper between View and the Model
class EmojiMemoryGame: ObservableObject {

    static let themes = [
        Theme.halloween,
        Theme.animals,
        Theme.vehicles,
        Theme.food,
        Theme.weather,
        Theme.sports
    ]

    // mark this so that we know that it is changed
    @Published private var model: MemoryGame<String>?
    @Published private(set) var currentTheme: Theme

    init() {
        currentTheme = Theme.halloween
        model = createMemoryGame(theme: currentTheme)
    }

    // this is a type function
    private func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        currentTheme = theme
        return MemoryGame(pairsOfCards: currentTheme.numberOfPairsToShow) { index in
            if currentTheme.emojis.shuffled().indices.contains(index) {
                // the real name is EmojiMemoryGame.emojis
                return currentTheme.emojis[index]
            } else {
                return "⁉️"
            }
        }
    }

    var cards: Array<MemoryGame<String>.Card> {
        if let cards = model?.cards {
            return cards
        } else {
            model = createMemoryGame(theme: generateRandomTheme())
            return model!.cards
        }
    }

    var score: Int {
        let matchedPairs = model?.matchedPairs ?? 0
        let unmatchedPairs = model?.unmatchedPairs ?? 0
        return (matchedPairs * 2) - (unmatchedPairs)
    }

    // MARK: - Intents

    func shuffle() {
        model!.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model!.choose(card)
    }

    func startNewGame() {
        // get new theme
        // set new cards
        model = createMemoryGame(theme: generateRandomTheme())
        // shuffle cards
        model!.shuffle()
    }

    private func generateRandomTheme() -> Theme {
        return EmojiMemoryGame.themes.randomElement() ?? Theme.halloween
    }

    func getColor() -> Color {
        switch currentTheme.color {
            case "brown": Color.brown
            case "orange": Color.orange
            case "red": Color.red
            case "green": Color.green
            case "blue": Color.blue
            case "purple": Color.purple
            default: Color.black
        }
    }
}
