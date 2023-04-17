//
//  DigitalColorValueView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct DigitalColorValueView: View {
    @Binding var sliderValue: Double
//    let digitalValue: String
    let displayedDigitalValue: String
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue)),").font(.largeTitle)
            Text(displayedDigitalValue).font(.largeTitle)
        }
    }
}
