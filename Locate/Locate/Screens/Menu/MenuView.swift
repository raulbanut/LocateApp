//
//  MenuView.swift
//  Locate
//
//  Created by Raul Banut on 11.09.2022.
//

import SwiftUI

struct MenuView: View {
    private let backgroundColor = Color.pewterBlue.opacity(0.5)
    
    var body: some View {
        VStack {
            TopBarView(
                text: "Who are you?",
                textColor: .black,
                color: backgroundColor) {
                
            }
            
            Color.pewterBlue.opacity(0.5)
            
            Color.teaGreen.opacity(0.5)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
