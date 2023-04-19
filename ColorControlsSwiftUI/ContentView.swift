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
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.3765624762, blue: 0.7304599881)
                .ignoresSafeArea()
                .onTapGesture {
                    isTextFieldFocused = false
                }
            
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
            .focused($isTextFieldFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isTextFieldFocused = false
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
