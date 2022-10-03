//
//  TopBarView.swift
//  Locate
//
//  Created by Raul Banut on 10.09.2022.
//

import SwiftUI

struct TopBarView: View {
    let text: String
    let textColor: Color
    let color: Color
    let callback: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Text(text)
                    .foregroundColor(textColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                Button {
                    callback()
                } label: {
                    HStack(spacing: 3) {
                        Image(systemName: "chevron.backward")
                        
                        Text("Back")
                    }
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(textColor)
                }
            }
            .padding()
            
            Rectangle()
                .frame(height: 1.5)
                .foregroundColor(.black.opacity(0.3))
        }
        .background(color)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(
            text: "Log in",
            textColor: .black,
            color: .pewterBlue,
            callback: { }
        )
    }
}
