//
//  TextFieldView.swift
//  Locate
//
//  Created by Raul Banut on 31.08.2022.
//

import SwiftUI

enum TextFieldType {
    case email, password
}

struct TextFieldView: View {
    @Binding var field: String
    
    var textFieldType: TextFieldType
    
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
        if textFieldType == .password {
            SecureField("Your Password", text: $field)
        } else {
            TextField("Your Email", text: $field)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(field: .constant("banut.raul@yahoo.com"), textFieldType: .email)
    }
}
