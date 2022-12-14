//
//  BackgroundBody.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import Foundation
import SwiftUI

struct BackgroundBody: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        path.move(to: .zero)
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.3125))
        
        path.addCurve(to: CGPoint(x: 40, y: 75),
                      control1: CGPoint(
                        x: rect.width - 40,
                        y: rect.height * 0.15625),
                      control2: CGPoint(
                        x: rect.width * 3/5,
                        y: rect.height * 0.09375))
        path.addCurve(to: CGPoint(x: 0, y: 50),
                      control1: CGPoint(x: 10, y: 75),
                      control2: CGPoint(x: 0, y: 65))
        
        path.addLine(to: .zero)
        
        path.move(to: CGPoint(x: 0, y: rect.height * 0.6875))
        
        path.addCurve(
            to: CGPoint(x: width - 40, y: height - 75),
            control1: CGPoint(
                x: 40,
                y: height * 0.84375),
            control2: CGPoint(
                x: width * 2/5,
                y: height * 0.90625)
        )
        path.addCurve(
            to: CGPoint(x: width, y: height - 50),
            control1: CGPoint(
                x: width - 10,
                y: height - 75),
            control2: CGPoint(
                x: width,
                y: height - 65)
        )
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.6875))
        
        path.closeSubpath()
        return path
    }
}
