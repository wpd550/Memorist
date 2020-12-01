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
    @Published private var model:MemoryGame<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis:Array<String> = ["😈","👻","👹","💩","💀","👺"]
//        let numbers:Int = Int.random(in:2..<6)
        let numbers:Int = 6
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
    
    
    func restartGame()
    {
        model =  EmojiMenoryGame.createMemoryGame()
    }
}
