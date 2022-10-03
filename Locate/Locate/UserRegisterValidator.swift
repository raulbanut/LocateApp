//
//  UserRegisterValidator.swift
//  Locate
//
//  Created by Raul Banut on 10.09.2022.
//

import Foundation

enum UserRegisterError: Error {
    case invalidEmail
    case invalidPassword
    
    var localizedDescription: String {
        switch self {
        case .invalidEmail:
            return "Please enter a valid email address. \n johny@gmail.com"
        case .invalidPassword:
            return "Use a strong password with at least one number, one upper letter and a lower letter."
        }
    }
}

struct UserRegisterValidator {
    static let EMAIL_REGEX_PATTERN = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let PASSWORD_REGEX_PATTERN = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
    
    static func validate(email: String) throws {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", EMAIL_REGEX_PATTERN)
        if !emailPredicate.evaluate(with: email) {
                throw UserRegisterError.invalidEmail
        }
    }
    
    static func validate(password: String) throws {
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", PASSWORD_REGEX_PATTERN)
        if !passwordPredicate.evaluate(with: password) {
            throw UserRegisterError.invalidPassword
        }
    }
}
