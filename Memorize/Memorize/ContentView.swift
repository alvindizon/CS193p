//
//  ContentView.swift
//  Memorize
//
//  Created by Alvin Dizon on 3/17/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = [ "👻", "🎃", "🕷️","😈", "👿", "👻", "🎃", "🕷️","👁️", "🏩", "🧨", "🍭"]
    let theme2: [String] = [ "🚗", "🚃", "🚄","🚈", "🛟", "✈️", "🛩️", "🚢","🚀", "🚊", "🚒", "🛴"]
    let theme3: [String] = [ "😇", "😘", "🥳","🤪", "😎", "🤩", "😏", "😌","😙", "🤪", "😋", "☺️"]
    let themeIcons: [String] = ["house", "car", "face.smiling"]
    let themeTitles: [String] = ["Default", "Transport", "Face"]

    @State var selectedThemeIndex = 0

    var body: some View {
        VStack {
            Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            ScrollView {
                cards
            }
            Spacer()
            buttons
        }
        .padding()
    }
    func getAllThemes() -> [[String]] {
        return [emojis, theme2, theme3]
    }

    func getTheme(selectedIndex: Int) -> [String] {
        return getAllThemes()[selectedIndex]
    }

    var themeChoosers: some View {
        HStack {
            ForEach(getAllThemes().indices, id: \.self) { index in
                Button(action: { 
                    selectedThemeIndex = index
                }, label: {
                    VStack {
                        Image(systemName: themeIcons[index])
                        Text(themeTitles[index]).font(.caption)
                    }
                })

            }
        }
    }

    var cards: some View {
        LazyVGrid(columns: [    GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                                        GridItem(.flexible())]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: getTheme(selectedIndex: selectedThemeIndex).shuffled()[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var buttons: some View {
        HStack {
            themeChoosers
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }

}

#Preview {
    ContentView()
}
