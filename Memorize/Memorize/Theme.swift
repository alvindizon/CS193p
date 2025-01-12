//
//  Theme.swift
//  Memorize
//
//  Created by Alvin Dizon on 1/12/25.
//

import SwiftUICore


struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairsToShow: Int
    let color: String

    var actualNumberOfPairs: Int {
        min(numberOfPairsToShow, emojis.count)
    }
}

extension Theme {
    static let halloween = Theme(
        name: "Halloween",
        emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🧟‍♂️", "🧛🏻‍♂️", "🦇", "🌙", "🕯️", "⚰️", "🩸"],
        numberOfPairsToShow: 8,
        color: "orange"
    )
    
    static let animals = Theme(
        name: "Animals",
        emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁", "🐯", "🐮"],
        numberOfPairsToShow: 10,
        color: "brown"
    )
    
    static let vehicles = Theme(
        name: "Vehicles",
        emojis: ["🚗", "✈️", "🚲", "🚂", "🚁", "🚀", "⛵️", "🛸", "🏎️", "🛵", "🚓", "🚑"],
        numberOfPairsToShow: 8,
        color: "red"
    )
    
    static let food = Theme(
        name: "Food",
        emojis: ["🍎", "🍕", "�hamburger", "🌮", "🍣", "🍜", "🍪", "🍩", "🍦", "🥑", "🥨", "🧀"],
        numberOfPairsToShow: 12,
        color: "green"
    )
    
    static let weather = Theme(
        name: "Weather",
        emojis: ["☀️", "🌤️", "☁️", "🌧️", "⛈️", "❄️", "🌈", "⭐️", "🌙", "⚡️", "💨", "☔️"],
        numberOfPairsToShow: 6,
        color: "blue"
    )
    
    static let sports = Theme(
        name: "Sports",
        emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "⛳️", "🏊‍♂️"],
        numberOfPairsToShow: 9,
        color: "purple"
    )
}
