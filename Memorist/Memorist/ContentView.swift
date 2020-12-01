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
        VStack{
            Grid(self.viewModel.cards){card in
                CardView(card:card).onTapGesture {
                    withAnimation(Animation.timingCurve(0, 0, 1, 1))
                    {
                        
                        self.viewModel.choose(card: card)
                    }
                }
            }
            .foregroundColor(Color.orange)
            .padding()
            Button(action: {
                //显示动画
                withAnimation(.easeIn){
                    viewModel.restartGame()
                }
            }, label: {
                Text("run again")
                    .font(.title)
                    .multilineTextAlignment(.leading)
            })
        }
        
    }
}




struct CardView: View {
    
    var isFaceup:Bool = false
    var card:MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{
            metrics in self.body(size: metrics.size)
        }
    }
    @ViewBuilder
    func body(size:CGSize) -> some View {
        if !card.isMatch || !card.isFaceDown
        {
            ZStack(content: {
                Pie().opacity(0.4).padding(5)
                Text(self.card.content).rotationEffect(Angle(degrees:card.isMatch ? 360.0:0.0)).animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false))
                             
            }).cardify(isFaceDown:self.card.isFaceDown)
            .font(Font.system(size: min(size.width, size.height)*scaleRate))
            .padding(padding)
//            .transition(AnyTransition.scale)
            .rotation3DEffect(
                Angle.degrees(card.isFaceDown ? 180:0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
                )
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
