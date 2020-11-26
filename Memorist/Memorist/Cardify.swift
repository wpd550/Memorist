//
//  Cardify.swift
//  Memorist
//
//  Created by dong wu on 2020/11/26.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI

struct Cardify:ViewModifier{
    var isFaceDown:Bool
    func body(content: Content) -> some View {
        ZStack{
            if(isFaceDown)
            {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
            }else
            {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                content
            }
        }
    }
    
    private let cornerRadius:CGFloat = 4
    private let lineWidth:CGFloat = 4
}

extension View
{
    func cardify(isFaceDown:Bool){
        self.modifier(Cardify(isFaceDown: isFaceDown))
    }
}
