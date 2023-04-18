//
//  RectangleColorView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/18/23.
//

import SwiftUI

struct RectangleColorView: View {
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double
    
    var body: some View {
        Rectangle()
            .frame(height: 200)
            .foregroundColor(Color(red: redSliderValue / 255,
                                   green: greenSliderValue / 255,
                                   blue: blueSliderValue / 255,
                                   opacity: 1))
        
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct RectangleColorView_Previews: PreviewProvider {
  
    static var previews: some View {
        RectangleColorView(redSliderValue: 0,
                           greenSliderValue: 0,
                           blueSliderValue: 0)
    }
}
