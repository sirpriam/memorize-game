//
//  ContentView.swift
//  vignette_memorize_22_sept
//
//  Created by Pangestu, Priambodo on 22/09/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🎃", "👻", "🤖", "😈", "👽", "🌝", "👹", "🤡"];
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "minus.circle")
            Spacer()
            cardCountAdjuster(by: 1, symbol: "plus.circle")
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        return Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
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
