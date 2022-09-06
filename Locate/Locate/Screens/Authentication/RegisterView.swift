//
//  RegisterView.swift
//  Locate
//
//  Created by Raul Banut on 31.08.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var field: String = ""
    
    var body: some View {
        ZStack {
            //            BackgroundView()
            Color.pewterBlue
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Text("What's your email?")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
//                    .background(.yellow)
                
                
                TextFieldView(field: $field, textFieldType: .email)
//                    .padding(.horizontal)
                    .padding()
//                    .background(.green)
                
                Spacer()
            }
            
            //
            //            VStack(alignment: .leading) {
            //                TextField("Your email", text: $field)
            //                    .foregroundColor(.pewterBlue)
            //                    .background(.white)
            //
            //                Text("What's your email?")
            //                    .background(.yellow)
            //                    .frame(maxWidth: .infinity)
            //            }
            //            .background(.green)
        }
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
