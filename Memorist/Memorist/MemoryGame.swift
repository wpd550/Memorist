//
//  MemoryGame.swift
//  Memorist
//
//  Created by dong wu on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation

class MemoryGame<CardContent> {
    var Cards:Array<Card>

    
    func choose(card:Card) ->Void {
        print("Choose Card : \(card)")
    }
    
    init(numbersOfItems:Int = 2) {
        self.Cards = Array<Card>()
        for index in 0..<numbersOfItems {
            self.Cards.append(Card(content: "s" as! CardContent ,index: index*2))
            self.Cards.append(Card(content: "s" as! CardContent ,index: index*2 + 1))
        }
        
    }
    struct Card {
        var index:Int
        var isFaceup:Bool = false
        var isMatch:Bool = false
        var content:CardContent
        init(content:CardContent, index:Int) {
            self.content = content
            self.index = index
        }
    }
    
}
