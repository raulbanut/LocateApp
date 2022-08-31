//
//  ContentView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

enum Destinations: Hashable {
    case onboarding
    case home
}

class Coordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func addView(for destination: Destinations) {
        navigationPath.append(destination)
    }
}

struct ContentView: View {
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            VStack {
                Button {
                    coordinator.addView(for: .home)
                } label: {
                    Text("Go home")
                }
            }
            .navigationDestination(for: Destinations.self) { item in
                if item == .home {
                    MainCoordinator()
                        .hideNavigationBar()
                        .environmentObject(coordinator)
                } else {
                    OnboardingCoordinator()
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
