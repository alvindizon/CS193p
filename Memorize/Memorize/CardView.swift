//
//  CardView.swift
//  Memorize
//
//  Created by Alvin Dizon on 3/10/25.
//
import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        Pie(endAngle: .degrees(240)).opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content).font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor) // if font is too big, scale to 1/100
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit) // fit to whatever size aspect ratio is
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            // cards that have been matched should be invisible
            .opacity(card.isFaceUp || !card.isMatched ? 1: 0)
    }

    private struct Constants {
        static let inset: CGFloat = 5

        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    typealias Card = MemoryGame<String>.Card
    return VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(Card(content: "X", id: "test1"))
        }
        HStack {
            CardView(Card(content: "X", id: "test1"))
            CardView(Card(isFaceUp: true, content: "This is a very long String and I hope it fits", id: "test1"))
        }
    }
    .padding()
    .foregroundColor(.green)

}
