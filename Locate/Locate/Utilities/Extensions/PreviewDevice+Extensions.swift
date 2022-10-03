//
//  PreviewDevice+Extensions.swift
//  Locate
//
//  Created by Raul Banut on 17.09.2022.
//

import Foundation
import SwiftUI

extension PreviewDevice {
    static let iPhoneSE_3rd = PreviewDevice(rawValue: "iPhone SE (3rd generation)")
    static let iPhone8 = PreviewDevice(rawValue: "iPhone 8")
    static let iPhone14 = PreviewDevice(rawValue: "iPhone 14")
    static let iPhone14Max = PreviewDevice(rawValue: "iPhone 14 Pro Max")
}

extension PreviewDevice: Identifiable {
    public var id: String { self.rawValue }
}

extension PreviewProvider {
    static var previewDevices: [PreviewDevice] {
        [.iPhone14Max, .iPhone8, .iPhone14]
    }
    
}
