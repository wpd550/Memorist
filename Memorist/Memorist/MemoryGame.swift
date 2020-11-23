//
//  MemoryGame.swift
//  Memorist
//
//  Created by dong wu on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards:Array<Card>

    mutating func choose(card:Card) ->Void {
        print("Choose Card : \(card)")
        let selectIndex = cards.firstItem(Matching:card)
        self.cards[selectIndex].isFaceup = !self.cards[selectIndex].isFaceup
    }
    
  
    
    init(numbersOfItems:Int = 2,CardContentFactory:(Int) -> CardContent) {
        self.cards = Array<Card>()
        for index in 0..<numbersOfItems {
            let content = CardContentFactory(index);
            self.cards.append(Card(id:index*2, content:content))
            self.cards.append(Card(id:index*2 + 1, content:content))
        }
        self.cards = self.cards.shuffled()
    }
    struct Card:Identifiable {
        var id: Int
        var isFaceup:Bool = false
        var isMatch:Bool = false
        var content:CardContent
        
    
        
    }
    
}
