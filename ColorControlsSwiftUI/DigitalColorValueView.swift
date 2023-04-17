//
//  DigitalColorValueView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct DigitalColorValueView: View {
    @Binding var sliderValueVar: Double
    
    var body: some View {
        Text("\(lround(sliderValueVar))").font(.largeTitle)
    }
}
