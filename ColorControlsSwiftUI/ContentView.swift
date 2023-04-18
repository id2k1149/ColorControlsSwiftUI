//
//  ContentView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.blue).ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                RectangleColorView(redSliderValue: redSliderValue,
                                   greenSliderValue: greenSliderValue,
                                   blueSliderValue: blueSliderValue)

                SliderView(digitalValue: $redSliderValue,
                           sliderColor: .red)
                
                SliderView(digitalValue: $greenSliderValue,
                           sliderColor: .green)
                
                SliderView(digitalValue: $blueSliderValue,
                           sliderColor: .blue)

                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        hideKeyboard()
                    }
                }
            }
            .padding()
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
