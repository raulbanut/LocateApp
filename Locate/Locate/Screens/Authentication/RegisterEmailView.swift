//
//  RegisterView.swift
//  Locate
//
//  Created by Raul Banut on 31.08.2022.
//

import SwiftUI

struct RegisterEmailView: View {
    @EnvironmentObject var coordinator : Coordinator
    
    @ObservedObject var viewModel : RegisterViewModel
    
    @FocusState var focused: Bool
    
    var body: some View {
        ZStack {
            Color.pewterBlue
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                TopBarView(
                    text: "Log in",
                    textColor: .white,
                    color: .white,
                    callback: {
                        coordinator.popView()
                    })
                
                VStack(spacing: 26) {
                    Text("What's your email?")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(text: $viewModel.email, type: .email)
                        .focused($focused)
                        .keyboardType(.emailAddress)
                    
                    PrimaryButton(
                        text: "Next",
                        image: nil,
                        buttonColor: .tuscanRed,
                        action: {
                            viewModel.validateEmail()
                            if !viewModel.isEmailUnverified {
                                coordinator.pushView(for: .registerPassword)
                            }
                        }
                    )
                    .alert("Invalid Email",
                           isPresented: $viewModel.isEmailUnverified,
                           actions: { },
                           message: {
                        Text("Please enter a valid email address.")
                    })
                    .frame(width: 180)
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear() {
            focused = true
        }
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView(viewModel: RegisterViewModel())
    }
}
