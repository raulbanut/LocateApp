//
//  Coordinator.swift
//  Locate
//
//  Created by Raul Banut on 05.09.2022.
//

import Foundation
import SwiftUI

enum AuthenticationDestinations: Hashable {
    case login
    case registerEmail
    case registerPassword
}

class AuthCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath() // private(set)

    func pushView(for destination: AuthenticationDestinations) {
        navigationPath.append(destination)
    }
    
    func popView() {
        navigationPath.removeLast()
    }
}
