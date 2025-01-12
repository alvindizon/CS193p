//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Dizon on 3/17/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            VStack {
                Text(String(format: "Score: %d", viewModel.score))
                Text("Theme: \(viewModel.currentTheme.name)")
            }
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                Spacer()
                Button("New Game") {
                    viewModel.startNewGame()
                }
            }
            .task {
                viewModel.startNewGame()
            }
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                VStack(spacing: 0) {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    Text(card.id)
                }
            }
        }
        .foregroundColor(viewModel.getColor())
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
