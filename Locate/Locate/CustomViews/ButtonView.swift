//
//  ButtonView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let image: Image
    let callback: () -> Void
    
    var body: some View {
        Button {
            callback()
        } label: {
            HStack{
                image
                    .padding(.leading, 16)
                Spacer()
                Text(text)
                    .kerning(0.5)
                Spacer()
            }
        }
        .font(.system(size: 16))
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.black)
        )
        .buttonStyle(.plain)

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            text: "Continue with Apple",
            image: Image(systemName: "applelogo"),
            callback: { }
        )
    }
}
