//
//  Pie.swift
//  Memorist
//
//  Created by dong wu on 2020/11/26.
//  Copyright © 2020 Ando. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    
    let startAngle:Angle
    let endAngle:Angle
    
    init(startDegrees:Double = 60,endDegrees:Double = 270) {
        self.startAngle = Angle(degrees: startDegrees)
        self.endAngle = Angle(degrees: endDegrees)
    }
    
    func path(in rect: CGRect) -> Path {
        
        let center:CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius:CGFloat = min(rect.size.width, rect.size.height)/2.0
        let startPoint:CGPoint = CGPoint(
                                            x: center.x + radius * cos(CGFloat(startAngle.radians)),
                                            y: center.y + radius * sin(CGFloat(startAngle.radians))
                                        )
        
        var path = Path()
        path.move(to: center)
        path.addLine(to:startPoint)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.addLine(to: center)
        
        return path
    }
}


