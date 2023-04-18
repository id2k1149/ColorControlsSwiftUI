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
    
    @State private var showAlert = false
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        
        HStack {
        
            HStack {
                Spacer()
                Text("\(lround(value))")
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: 48)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
            
            TextField("",
                      text: Binding(
                        get: {
                            "\(lround(value))"
                        },
                        set: {newValue in
                            if let valueAsDouble = Double(newValue) {
                                digitalValue = newValue
                                value = valueAsDouble
                            } else {
                                showAlert = true
                            }
                        }
                      ))
            .frame(width: 64)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(.black)
            .background(Color.white)
            .bold()
            .focused($isTextFieldFocused)
            .onTapGesture {
                isTextFieldFocused = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"),
                      message: Text("Please enter a valid number"),
                      dismissButton: .default(Text("OK")))
            }
            .onSubmit {
                guard let valueAsDouble = Double(digitalValue) else { return}
                if valueAsDouble < 0 || valueAsDouble > 255 {
                    showAlert = true
                }
                value = valueAsDouble
            }
            .cornerRadius(8)
            .keyboardType(.numberPad)
        }

    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
