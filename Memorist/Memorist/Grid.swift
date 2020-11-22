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
            self.body(for: geometry.size)
        }
    }
    
    func body(for size:CGSize)->some View{
        ForEach(self.items){ item in
            self.body(for:item,size: size)
        }
    }
    
    func body(for item:Item,size:CGSize)->some View
    {
        print("size \(size)");
        return viewForItem(item)
    }
}
