//
//  TextFieldView.swift
//  ColorControlsSwiftUI
//
//  Created by Max Franz Immelmann on 4/18/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var digitalValue: Double
    @Binding var stringValue: String
    
    @State private var showAlert = false
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        TextField("", text: $stringValue)
        .frame(width: 56)
        .cornerRadius(8)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .foregroundColor(.black)
        .background(Color.white)
        .bold()
        .keyboardType(.numberPad)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid Input"),
                  message: Text("Please enter a number from 0 to 255"),
                  dismissButton: .default(Text("OK")))
        }
        .onSubmit {
            withAnimation {
                validate()
            }
        }
    }
}

extension TextFieldView {
    private func validate() {
        guard let valueAsDouble = Double(stringValue) else {
            showAlert = true
            stringValue = "\(lround(digitalValue))"
            return
            }
        
        if valueAsDouble < 0 || valueAsDouble > 255 {
            showAlert = true
            stringValue = "\(lround(digitalValue))"
        } else {
            digitalValue = valueAsDouble
        }
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
