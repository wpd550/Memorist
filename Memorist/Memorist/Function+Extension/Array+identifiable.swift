//
//  Array+identifly.swift
//  Memorist
//
//  Created by dong wu on 2020/11/23.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable
{
    func firstItem(Matching:Element) -> Int? {
        for idx in 0..<self.count {
            if(self[idx].id == Matching.id)
            {
                return idx
            }
        }
        return nil
    }
}
