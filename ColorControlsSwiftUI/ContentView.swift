//
//  ContentView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...1)
    
    var body: some View {
        VStack {
            Text("\(sliderValue)")
                .font(.largeTitle)
            SliderView(value: $sliderValue, textColor: .red)
            SliderView(value: $sliderValue, textColor: .green)
            SliderView(value: $sliderValue, textColor: .blue)
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


