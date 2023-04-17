//
//  ContentView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var digitalValue = ""
    
    var body: some View {
        VStack {
            DigitalColorValueView(sliderValue: $sliderValue)
            SliderView(value: $sliderValue,
                       digitalValue: $digitalValue,
                       textColor: .red)
            Button("Done", action: checkDigitalValue)
            Spacer()
        }
        .padding()
    }
    
    private func checkDigitalValue() {
        if let _ = Double(digitalValue) {
            sliderValue = Double(digitalValue) ?? 0
        }
        digitalValue = ""
        return
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
