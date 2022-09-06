//
//  ContentView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = Coordinator()
    
    
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            AuthenticationView(
                loginGoogle: {},
                loginEmail: { print("Login with Email")}
            )
            
            .environmentObject(coordinator)
//            .toolbarColorScheme(.light, in: .navigationBar)
//            .toolbarBackground(.automatic, in: .navigationBar)
            .navigationDestination(for: Destinations.self) { item in
                if item == .register {
                    RegisterView()
                        .navigationTitle("Log In")
                        .toolbarRole(.editor)
                        .toolbarColorScheme(.dark, in: .navigationBar)
//                        .hideNavigationBar()
                        .environmentObject(coordinator)
                }
//                    OnboardingCoordinator()
//                        .hideNavigationBar()
//                        .environmentObject(coordinator)
                    

            }
            //            VStack {
            //                Button {
            //                    coordinator.addView(for: .home)
            //                } label: {
            //                    Text("Go home")
            //                }
            //            }
            //            .navigationDestination(for: Destinations.self) { item in
            //                if item == .home {
            //                    MainCoordinator()
            //                        .hideNavigationBar()
            //                        .environmentObject(coordinator)
            //                } else {
            //                    OnboardingCoordinator()
            //                        .hideNavigationBar()
            //                        .environmentObject(coordinator)
            //
            //                }
            //            }
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
