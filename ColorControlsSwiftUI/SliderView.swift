//
//  SliderView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var digitalValue: String
    let sliderColor: Color
    
    var body: some View {
        HStack {
//            Text("0")
//                .foregroundColor(sliderColor)
//                .bold()
            HStack {
                Text("\(sliderColor.description):")
                    .bold()

                Spacer()
                Text("\(lround(value))")
                    .bold()
            }
            .frame(width: 96)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
//            Text("255")
//                .foregroundColor(sliderColor)
//                .bold()
            TextField("", text: $digitalValue)
                .frame(width: 48)
                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .onAppear {
//                    digitalValue = "\(lround(value))"
//                }
                .keyboardType(.numberPad)
                .overlay(
                    Text("\(lround(value))")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .bold()
                        .opacity(digitalValue.isEmpty ? 1 : 0)
                )
                .onSubmit {
                    // Add your action here
                    if let _ = Double(digitalValue) {
                        value = Double(digitalValue) ?? 0
                    }
                    digitalValue = ""
                }
            /*
                .onChange(of: digitalValue) { newValue in
                    if let intValue = Int(newValue), (0...255).contains(intValue) {
                        print("Valid value entered: \(intValue)")
                        // Add your valid value action here
                    } else {
                        print("Invalid value entered: \(newValue)")
                        // Add your invalid value action here, such as showing an alert
                    }
                }
             */

            
        }

    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
