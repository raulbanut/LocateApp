//
//  PrimaryButton.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    let image: Image?
    let buttonColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                image
                    .padding(.leading, 16)
                
                Text(text)
                    .kerning(0.5)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(buttonColor)
        )
        .buttonStyle(.plain)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.pewterBlue
            
            VStack {
                PrimaryButton(
                    text: "Continue with Apple",
                    image: Image(systemName: "applelogo"),
                    buttonColor: .black,
                    action: { }
                )
                
                PrimaryButton(
                    text: "Next",
                    image: nil,
                    buttonColor: .cedarChest,
                    action: { }
                )
                
                PrimaryButton(
                    text: "Next",
                    image: nil,
                    buttonColor: .tuscanRed,
                    action: { }
                )
            }
        }
    }
}
