//
//  SliderView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var digitalValue: String
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(textColor)
            Text("255").foregroundColor(textColor)
            TextField("\(lround(value))", text: $digitalValue)
                .frame(width: 48)
                .textFieldStyle(.roundedBorder)
            
        }
    }
}
