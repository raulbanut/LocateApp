//
//  AuthenticationView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var coordinator : Coordinator
    
    @State private var buttonIsPressed = false
    @State private var registerButtonIsPresent = true
    
    var onLoginGoogle: () -> Void
    var onLoginEmail: () -> Void
    
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
                    .frame(maxHeight: .infinity)
                
                Image(systemName: "globe.europe.africa.fill")
                    .font(.system(size: 200))
                    .foregroundColor(.cedarChest)
                
                Spacer()
                
                TermsView()
                
                buttons
                
                AlreadyHaveAccountView(registerButtonIsPresent: $registerButtonIsPresent)
            }
            .opacity(buttonIsPressed ? 0.1 : 1)
            .padding()
        }
    }
    
    var buttons: some View {
        VStack(spacing: 8) {
            PrimaryButton(
                text: "Continue with Google",
                image: Image(systemName: "g.square.fill"),
                buttonColor: .black
            ) {
                buttonIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    buttonIsPressed = false
                }
            }
            
            PrimaryButton(
                text: "Continue with Apple",
                image: Image(systemName: "applelogo"),
                buttonColor: .black
            ) {
                buttonIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    buttonIsPressed = false
                }
            }
            
            if registerButtonIsPresent {
                PrimaryButton(
                    text: "Continue with Email",
                    image: Image(systemName: "envelope.fill"),
                    buttonColor: .black
                ) {
                    buttonIsPressed = true
                    DispatchQueue.main.asyncAfter(deadline: .now() ) {
                        buttonIsPressed = false
                        onLoginEmail()
                        coordinator.pushView(for: .registerEmail)
                    }
                }
            }
        }
        .padding(8)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(onLoginGoogle: { }, onLoginEmail: { })
    }
}


