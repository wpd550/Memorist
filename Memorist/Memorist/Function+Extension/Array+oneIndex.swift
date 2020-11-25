//
//  Array+oneIndex.swift
//  Memorist
//
//  Created by dong wu on 2020/11/25.
//  Copyright © 2020 Ando. All rights reserved.
//

import Foundation


extension Array {
    func one() -> Element? {
        self.count == 1 ? self.first:nil
    }
}
