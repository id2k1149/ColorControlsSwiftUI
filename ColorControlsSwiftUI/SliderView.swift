//
//  SliderView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }
    }
}
