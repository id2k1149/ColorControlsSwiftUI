//
//  SliderView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/17/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var digitalValue: Double
    @State private var stringValue = ""
    let sliderColor: Color
    
    var body: some View {
        
        HStack {
        
            HStack {
                Spacer()
                Text("\(lround(digitalValue))")
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: 48)
            
            Slider(value: $digitalValue, in: 0...255, step: 1)
                .accentColor(sliderColor)
                .onChange(of: digitalValue) { newValue in
                    stringValue = "\(lround(newValue))"
                }
            
            TextFieldView(digitalValue: $digitalValue,
                          stringValue: $stringValue)
        }
        .onAppear {
            stringValue = "\(lround(digitalValue))"
        }

    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
