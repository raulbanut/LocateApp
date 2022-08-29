//
//  TermsView.swift
//  Locate
//
//  Created by Raul Banut on 29.08.2022.
//

import SwiftUI

struct TermsView: View {
    let text = Text("By creating an account you accet our") + Text(" terms of service").underline() +
    Text(" and") + Text(" privacy policy.").underline()
    
    let url = URL(string: "https://www.tapptitude.com/")!
    
    @State private var isPresenting = false
    
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            text
        }
        .buttonStyle(.plain)
        .multilineTextAlignment(.center)
        .foregroundColor(.black)
        .frame(width: 250)
        .lineLimit(2)
        .minimumScaleFactor(0.8)
        .confirmationDialog("Which would you like to see?", isPresented: $isPresenting, titleVisibility: .visible) {
                Link(destination: url) {
                    Text("Terms of service")
                }
                Link(destination: url) {
                    Text("Privacy policy")
                }
            }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
