//
//  AuthenticationView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var buttonIsPressed = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            if buttonIsPressed { LoadingView() }
            
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
                
                buttons
//                
//                NavigationLink("Hello") {
//                    RegisterView()
//                }.foregroundColor(.black)
            }
            .opacity(buttonIsPressed ? 0.1 : 1)
            .padding()
        }
    }
    
    var buttons: some View {
        VStack(spacing: 8) {
            ButtonView(text: "Continue with Email", image: Image(systemName: "envelope.fill")) {
                buttonIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    buttonIsPressed = false
                }
            }
            
            ButtonView(text: "Continue with Apple", image: Image(systemName: "applelogo")) {
                buttonIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    buttonIsPressed = false
                }
            }
        }
        .padding(8)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
