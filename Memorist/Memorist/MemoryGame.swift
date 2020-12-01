//
//  MemoryGame.swift
//  Memorist
//
//  Created by dong wu on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards:Array<Card>
    
    private var indexOfCardOneIsFaceup:Int?{
        get{
            cards.indices.filter {
                !cards[$0].isFaceDown
            }.one()
        }
        set
        {
            for index in cards.indices
            {
                cards[index].isFaceDown = index != newValue
            }
        }
    }
    
    //struct 中在函数中改变了自己的成员变量  要加mutating
    mutating func choose(card:Card) ->Void {
        if let selectIndex = cards.firstItem(Matching:card),cards[selectIndex].isFaceDown,!cards[selectIndex].isMatch{
            if let potentialMathIndex = indexOfCardOneIsFaceup
            {
                if(cards[potentialMathIndex].content == cards[selectIndex].content)
                {
                    cards[potentialMathIndex].isMatch = true
                    cards[selectIndex].isMatch = true
                }
                self.cards[selectIndex].isFaceDown = false
            }else{
                indexOfCardOneIsFaceup = selectIndex
            }
           
        }
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
    
    mutating func shuffle(){
        self.cards.shuffle()
    }
    struct Card:Identifiable {
        var id: Int
        var isFaceDown:Bool = true
        var isMatch:Bool = false
        var content:CardContent
    }
  
}
