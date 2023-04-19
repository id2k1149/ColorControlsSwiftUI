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
    
    var body: some View {
        TextField("",
                  text: $stringValue,
                  onEditingChanged: { _ in
                        withAnimation {
                            validate()
                        }
                    }
        )
        .frame(width: 56)
        .multilineTextAlignment(.trailing)
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
//        .onSubmit {
//            withAnimation {
//                validate()
//            }
//        }
        .cornerRadius(8)
    }
}

extension TextFieldView {
    private func validate() {
        if let value = Int(stringValue), (0...255).contains(value) {
            self.digitalValue = Double(value)
            return
        }
        showAlert.toggle()
        digitalValue = 0
        stringValue = "0"
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextFieldView(digitalValue: .constant(128.0),
                          stringValue: .constant("128"))
        }
    }
}
