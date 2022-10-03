//
//  RegisterPasswordView.swift
//  Locate
//
//  Created by Raul Banut on 11.09.2022.
//

import SwiftUI

struct RegisterPasswordView: View {
    @EnvironmentObject var coordinator : AuthCoordinator
    
    @ObservedObject var viewModel : RegisterViewModel
    
    @FocusState var focused: Bool
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color.pewterBlue
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                TopBarView(
                    text: "Log in",
                    textColor: .white,
                    color: .pewterBlue,
                    callback: {
                        coordinator.popView()
                    })
                .disabled(isLoading)
                
                VStack(spacing: 26) {
                    Text("Enter your password")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(text: $viewModel.password, type: .password)
                        .focused($focused)
                        .keyboardType(.emailAddress)
                    
                    PrimaryButton(
                        text: "Next",
                        image: nil,
                        buttonColor: .tuscanRed,
                        action: {
                            viewModel.validatePassword()
                            if !viewModel.isPasswordUnverified {
                                isLoading = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    isLoading = false
                                }
                            }
                        }
                    )
                    .disabled(isLoading)
                    .alert("Invalid Password",
                           isPresented: $viewModel.isPasswordUnverified,
                           actions: { },
                           message: {
                        Text("Please enter a valid password.")
                    })
                    .frame(width: 180)
                }
                .padding()
                
                Spacer()
            }
            
            if isLoading { LoadingView(viewOpacity: 0.5, backgroundColor: .white) }
        }
        .onAppear() {
            focused = true
        }
    }
}

struct RegisterPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPasswordView(viewModel: RegisterViewModel())
    }
}
