//
//  View+cardifiy.swift
//  Memorist
//
//  Created by dong wu on 2020/12/1.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI


extension View
{
    func cardify(isFaceDown:Bool)-> some View{
        return  self.modifier(Cardify(isFaceDown: isFaceDown))
    }
}

