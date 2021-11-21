//
//  ContentView.swift
//  CS193-Memorize
//
//  Created by nlimpid on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["h", "i", "x", "j", "a", "b", "c", "d", "e", "f", "g", "y", "k", "l", "m", "n", "o", "dfs", "dfasdfsd", "hello", "dfsadf"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60, maximum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            

            HStack {
                remove
                Spacer()
                add
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
            

        }

    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -=  1
            }
            
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        })
    }
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount +=  1
            }
            
        }, label: {
            
            VStack {
                Image(systemName: "plus.circle")
            }
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
