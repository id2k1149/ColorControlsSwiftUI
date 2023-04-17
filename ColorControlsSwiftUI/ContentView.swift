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
    
    @State private var redDigitalValue = ""
    @State private var greenDigitalValue = ""
    @State private var blueDigitalValue = ""
    
//    @State private var alertPresented = false
    
    var body: some View {
        ZStack {
            Color(.cyan).ignoresSafeArea()
            
            VStack {
//                HStack {
//                    Text("\(lround(redSliderValue))").font(.largeTitle)
//                    Text("\(lround(greenSliderValue))").font(.largeTitle)
//                    Text("\(lround(blueSliderValue))").font(.largeTitle)
//                }
                
                Rectangle()
                    .frame(height: 200)
                    .foregroundColor(Color(red: redSliderValue / 255,
                                           green: greenSliderValue / 255,
                                           blue: blueSliderValue / 255,
                                           opacity: 1))
                   
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 4)
                    )

                SliderView(value: $redSliderValue,
                           digitalValue: $redDigitalValue,
                           sliderColor: .red)
                
                SliderView(value: $greenSliderValue,
                           digitalValue: $greenDigitalValue,
                           sliderColor: .green)
                
                SliderView(value: $blueSliderValue,
                           digitalValue: $blueDigitalValue,
                           sliderColor: .blue)
                
                /*
                Button("Done", action: checkDigitalValue)
                    .alert(
                        "Wrong Format",
                        isPresented: $alertPresented,
                        actions: {}
                    ) { Text("Enter value from 0 to 255") }
                 */

                Spacer()
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
