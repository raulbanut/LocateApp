//
//  BackgroundView.swift
//  Locate
//
//  Created by Raul Banut on 24.08.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        BackgroundBody()
            .foregroundColor(.pewterBlue)
            .ignoresSafeArea()
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
        //            .previewDevice("iPhone SE (3rd generation)")
    }
}
