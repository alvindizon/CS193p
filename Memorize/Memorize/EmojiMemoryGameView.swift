//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Dizon on 3/17/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    let emojis: [String] = [ "👻", "🎃", "🕷️","😈", "😈", "👻", "🎃", "🕷️","😈", "🏩", "🧨", "🍭"]

    let aspectRatio: CGFloat = 2/3

    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }


    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            VStack {
                CardView(card)
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
                Text(card.id)
            }
        }
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01) // if font is too big, scale to 1/100
                    .aspectRatio(1, contentMode: .fit) // fit to whatever size aspect ratio is
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        // cards that have been matched should be invisible
        .opacity(card.isFaceUp || !card.isMatched ? 1: 0)
    }

}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
