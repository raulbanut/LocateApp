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
    case register
}

class Coordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
//    init() {
//        print("Am intrat pe aici")
//        self.addView(for: .login)
//    }
    
    func addView(for destination: Destinations) {
        navigationPath.append(destination)
    }
}
