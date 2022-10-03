//
//  Coordinator.swift
//  Locate
//
//  Created by Raul Banut on 05.09.2022.
//

import Foundation
import SwiftUI

enum Destinations: Hashable {
    case login
    case registerEmail
    case registerPassword
}

class Coordinator: ObservableObject {
    @Published var navigationPath = NavigationPath() // private(set)

    func pushView(for destination: Destinations) {
        navigationPath.append(destination)
    }
    
    func popView() {
        navigationPath.removeLast()
    }
}
