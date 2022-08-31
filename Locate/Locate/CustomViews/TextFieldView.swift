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
        pickTextField(textFieldType)
            .foregroundColor(.cedarChest)
            .font(.title3)
            .textFieldStyle(.roundedBorder)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
    
    @ViewBuilder
    func pickTextField(_ textField: TextFieldType) -> some View {
        if textField == .password {
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
