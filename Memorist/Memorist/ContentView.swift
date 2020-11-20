//
//  ContentView.swift
//  Memorist
//
//  Created by dong on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel:EmojiMenoryGame = EmojiMenoryGame()
    var body: some View {
        HStack(content: {
            ForEach(viewModel.cards ,content: {card in
                CardView(card:card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.font(self.viewModel.font())
            })
        })
        .foregroundColor(Color.orange).padding().font(Font.largeTitle)
    }
}




struct CardView: View {
    
    var isFaceup:Bool = false
    var card:MemoryGame<String>.Card
    
    var body: some View{
        
        GeometryReader{
            metrics in ZStack(content: {
                if(self.card.isFaceup)
                {
                    RoundedRectangle(cornerRadius: 4).fill(Color.orange).frame(height:metrics.size.width*1.5)
                }else
                {
                    RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 4).frame(height:metrics.size.width*1.5)
                    RoundedRectangle(cornerRadius: 4).fill(Color.white).frame(height:metrics.size.width*1.5)
                    Text(self.card.content)
                }
            })
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
