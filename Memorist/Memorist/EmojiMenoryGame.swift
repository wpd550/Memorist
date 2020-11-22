//
//  EmojiMenoryGame.swift
//  Memorist
//
//  Created by dong wu on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation
import SwiftUI


class EmojiMenoryGame:ObservableObject {
    @Published public var model:MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis:Array<String> = ["😈","👻","👹","💩","💀"]
        let numbers:Int = Int.random(in:2..<6)
        return MemoryGame<String>(numbersOfItems: numbers) { (index) -> String in
            return emojis[index]
        }
    }
    //Mark:  - Access to model
    var cards:Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //Mark: - Intent
    func choose(card:MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func shuffle()
    {
        model.cards.shuffle();
    }
    
    //Mark: Font
    func font()->Font{
        if(self.cards.count == 5)
        {
            return  Font.title
        }else
        {
            return Font.largeTitle
        }
    }
}
