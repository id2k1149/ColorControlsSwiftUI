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
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            DigitalColorValueView(sliderValue: $sliderValue)
            SliderView(value: $sliderValue,
                       digitalValue: $digitalValue,
                       textColor: .red)
            Button("Done", action: checkDigitalValue)
                .alert("Wrong Format",
                       isPresented: $alertPresented) {
                    Button("OK") {}
                } message: {
                    Text("Enter value from 0 to 255")
                }

            Spacer()
        }
        .padding()
    }
    
    private func checkDigitalValue() {
        if let _ = Double(digitalValue) {
            sliderValue = Double(digitalValue) ?? 0
        } else {
            alertPresented.toggle()
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
