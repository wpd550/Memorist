//
//  ContentView.swift
//  Memorist
//
//  Created by dong on 2020/11/20.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(content: {
            ForEach(0..<6 ,content: {_ in
                CardView(isFaceup: true)
            })
        })
        .foregroundColor(Color.orange).padding()
    }
}




struct CardView: View {
    
    var isFaceup:Bool = false
    
    var body: some View{
   
        return ZStack(content: {
            if(isFaceup)
            {
                RoundedRectangle(cornerRadius: 4).fill(Color.orange)
            }else
            {
                RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 4)
                RoundedRectangle(cornerRadius: 4).fill(Color.white)
                Text("😈")
            }
        })
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
