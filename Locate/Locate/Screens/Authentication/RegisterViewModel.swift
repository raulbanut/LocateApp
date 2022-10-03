//
//  RegisterViewModel.swift
//  Locate
//
//  Created by Raul Banut on 10.09.2022.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var isEmailUnverified: Bool = false
    
    @Published var password: String = ""
    @Published var isPasswordUnverified: Bool = false
    
    func validateEmail() {
        do {
            try UserRegisterValidator.validate(email: self.email)
            isEmailUnverified = false
        } catch {
            isEmailUnverified = true
        }
    }
    
    func validatePassword() {
        do {
            try UserRegisterValidator.validate(password: self.password)
            isPasswordUnverified = false
        } catch {
            isPasswordUnverified = true
        }
    }
}
