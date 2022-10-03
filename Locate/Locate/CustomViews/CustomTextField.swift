//
//  CustomTextField.swift
//  Locate
//
//  Created by Raul Banut on 31.08.2022.
//

import SwiftUI

extension CustomTextField {
    enum TextFieldType {
        case email, password
    }
}

struct CustomTextField: View {
    @Binding var text: String
    
    var type: TextFieldType
    
    var body: some View {
        inputField
            .fontWeight(.semibold)
            .foregroundColor(.pewterBlue)
            .font(.title3)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
            }
    }
    
    @ViewBuilder
    var inputField: some View {
        if type == .password {
            SecureField("Your Password", text: $text)
        } else {
            TextField("Your Email", text: $text)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("banut.raul@yahoo.com"), type: .email)
    }
}
