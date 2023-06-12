//
//  ContentView.swift
//  Arrow-Challenge
//
//  Created by Robert Basamac on 06.06.2023.
//

import SwiftUI

struct ArrowShape: InsettableShape {

    var insetAmount = 0.0
    
    var thickness: CGFloat

    var animatableData: CGFloat {
           get { thickness }
           set { thickness = newValue }
       }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        path.move(to: CGPoint(x: width/2, y: insetAmount))
        path.addLine(to: CGPoint(x: width - insetAmount, y: height / 2))
        path.addLine(to: CGPoint(x: width / 2 + width / 30, y: height / 4))
        path.addLine(to: CGPoint(x: width / 2 + width / 30, y: height - insetAmount))
        path.addLine(to: CGPoint(x: width / 2 - width / 30, y: height - insetAmount))
        path.addLine(to: CGPoint(x: width / 2 - width / 30, y: height / 4))
        path.addLine(to: CGPoint(x: insetAmount, y: height / 2))
        path.addLine(to: CGPoint(x: width / 2, y: insetAmount))

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ContentView: View {
    
    @State private var lineThickness: CGFloat = 8
    
    var body: some View {
        ArrowShape(thickness: lineThickness)
            .strokeBorder(Color.red, style: StrokeStyle(lineWidth: lineThickness, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation {
                    lineThickness = lineThickness == 2 ? 8 : 2
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
