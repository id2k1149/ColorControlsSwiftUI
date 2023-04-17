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
    @State private var displayedDigitalValue = ""
    
    var body: some View {
        VStack {
            DigitalColorValueView(sliderValue: $sliderValue,
                                  displayedDigitalValue: displayedDigitalValue)
            SliderView(value: $sliderValue,
                       digitalValue: $digitalValue,
                       textColor: .red)
            Button("Done") {
                displayedDigitalValue = digitalValue
                digitalValue = ""
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
