//
//  GradientRectangle.swift
//  Drawing
//
//  Created by Steven McWee on 23/02/2023.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var startX = 0.5
    var startY = 0.0
    
    var endX = 0.5
    var endY = 1.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [color(for: value, brightness: 1), color(for: value, brightness: 1)]), startPoint: UnitPoint(x: startX, y: startY), endPoint: UnitPoint(x: endX, y: endY))
                        )
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct GradientRectangle: View {
    @State private var colorCycle = 0.0
    @State private var startX = 0.5
    @State private var startY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle, startX: startX, startY: startY)
                .frame(width: 300, height: 300)
            
            HStack {
                Text("Colour")
                    .padding(.trailing)
                Slider(value: $colorCycle)
            }
            .padding()
        }
    }
}

struct GradientRectangle_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangle()
    }
}
