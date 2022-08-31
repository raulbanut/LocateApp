//
//  LoadingView.swift
//  Locate
//
//  Created by Raul Banut on 30.08.2022.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false

    var animation : Animation {
        Animation.spring(response: 0.45, dampingFraction: 0.25).repeat(while: isAnimating)
    }
    
    var items: [LoadingImageItem] = [
        LoadingImageItem(
            name: "airplane",
            color: .cedarChest,
            delay: 0.1
        ),
        LoadingImageItem(
            name: "house.fill",
            color: .tuscanRed,
            delay: 0.3
        ),
        LoadingImageItem(
            name: "sun.max.fill",
            color: .rhythm,
            delay: 0.5
        ),
        LoadingImageItem(
            name: "cloud.fill",
            color: .pewterBlue,
            delay: 0.7
        )
    ]
    
    var body: some View {
        ZStack {
//            Color.gray
//                .opacity(0.3)
//                .edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 32) {
                ForEach(items, id:\.self) { item in
                    Image(systemName: item.name)
                        .foregroundColor(item.color)
                        .font(.largeTitle)
                        .scaleEffect(isAnimating ? 1 : 0.5)
                        .animation(animation.delay(item.delay),
                                   value: isAnimating)
                }
            }
            .onAppear {
                isAnimating.toggle()
            }
        }
    }
}

struct LoadingImageItem: Hashable {
    var name: String
    var color: Color
    var delay: Double
}

extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
