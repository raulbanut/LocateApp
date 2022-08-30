//
//  BackgroundView.swift
//  Locate
//
//  Created by Raul Banut on 24.08.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            BackgroundBody()
                .foregroundColor(.pewterBlue)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Spacer()
                
                Text("Locate")
                    .bold()
                    .foregroundColor(.cedarChest)
                    .font(.largeTitle)
                
                Image(systemName: "globe.europe.africa.fill")
                    .font(.system(size: 200))
                    .foregroundColor(.cedarChest)
                
                Spacer()
                
                TermsView()
                
                VStack(spacing: 8) {
                    ButtonView(text: "Continue with Email", image: Image(systemName: "envelope.fill")) {
                        
                    }
                    ButtonView(text: "Continue with Apple", image: Image(systemName: "applelogo")) {
                        
                    }
                }
                .padding(8)
            }
            .padding()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
//            .previewDevice("iPhone SE (3rd generation)")
    }
}
