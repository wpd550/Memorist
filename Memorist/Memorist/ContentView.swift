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
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}




struct CardView: View {
    
    var isFaceup:Bool = false
    var card:MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{
            metrics in ZStack(content: {
                Pie().opacity(0.4).padding(5)
                Text(self.card.content)
                             
            }).cardify(isFaceDown:self.card.isFaceDown)
//            .font(Font.system(size: min(metrics.size.width, metrics.size.height)*scaleRate))
//            .padding(padding)
        }
    }
    
    //MARK:  -- View Valve

    private let scaleRate:CGFloat = 0.6
    private let padding:CGFloat = 5
    
    
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMenoryGame()
        game.choose(card: game.cards[0])
        return  ContentView(viewModel:game)
    }
}
