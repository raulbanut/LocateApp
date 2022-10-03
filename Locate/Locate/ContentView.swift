//
//  ContentView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = AuthCoordinator()
    
    private var registerViewModel = RegisterViewModel()

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            AuthenticationView(
                onLoginGoogle: {},
                onLoginEmail: { print("Login with Email") }
            )
            .environmentObject(coordinator)
            .navigationDestination(for: AuthenticationDestinations.self) { item in
                if item == .registerEmail {
                    RegisterEmailView(viewModel: registerViewModel)
                        .hideNavigationBar()
                        .environmentObject(coordinator)
                } else if item == .registerPassword {
                    RegisterPasswordView(viewModel: registerViewModel)
                        .hideNavigationBar()
                        .environmentObject(coordinator)
                }
            }
        }
        
    }
}

extension View {
    func hideNavigationBar() -> some View {
        self.navigationBarBackButtonHidden()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
