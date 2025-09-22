//
//  ContentView.swift
//  vignette_memorize_22_sept
//
//  Created by Pangestu, Priambodo on 22/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
        .imageScale(.large)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 10)
                Text("Hi there")
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
