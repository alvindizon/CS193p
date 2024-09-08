//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alvin Dizon on 3/17/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // outside state objects
    @StateObject var game = EmojiMemoryGame
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
