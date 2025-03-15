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

    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4

    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
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
                    .padding(spacing)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
                Text(card.id)
            }
        }
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
