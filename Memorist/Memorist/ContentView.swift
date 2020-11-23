//
//  ContentView.swift
//  Memorist
//
//  Created by dong on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel:EmojiMenoryGame = EmojiMenoryGame()
    var body: some View {
        Grid(self.viewModel.cards){card in
            CardView(card:card).onTapGesture {
                self.viewModel.choose(card: card)
            }.font(self.viewModel.font())
        }
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
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
                    RoundedRectangle(cornerRadius: 4).fill(Color.orange)
                }else
                {
                    RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 4)
                    RoundedRectangle(cornerRadius: 4).fill(Color.white)
                    Text(self.card.content)
                }
            }).font(Font.system(size: min(metrics.size.width, metrics.size.height)*0.80)).padding(5)
        }

    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
