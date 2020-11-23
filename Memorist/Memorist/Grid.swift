//
//  Grid.swift
//  Memorist
//
//  Created by dong on 2020/11/22.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI


struct Grid<Item,ItemView>: View where Item:Identifiable,ItemView:View {
    
    var items:[Item]
    var viewForItem:(Item)->ItemView
    
    //逃逸必包 在函数结束之后在使用，需要@escaping
    init(_ items:[Item],viewForItem:@escaping (Item)->ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        
        GeometryReader{ geometry in 
            self.body(for: GridLayout(itemCount:self.items.count,in:geometry.size))
        }
    }
    
    func body(for layout:GridLayout)->some View{
        ForEach(self.items){ item in
            self.body(for:item,layout:layout)
        }
    }
    
    func body(for item:Item,layout:GridLayout)->some View
    {
        
        let index = items.firstItem(Matching:item)
  
        return viewForItem(item)
            .frame(width:layout.itemSize.width,height:layout.itemSize.height)
            .position(layout.location(ofItemAt:index))
    }
}


