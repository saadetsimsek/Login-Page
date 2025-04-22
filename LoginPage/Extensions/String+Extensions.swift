//
//  String+Extensions.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 22/04/2025.
//

import Foundation

//String üzerinde çalışarak, e-posta adresinin geçerli olup olmadığını kontrol eder. Eğer geçerli formatta bir e-posta ise, true döner, değilse false
extension String {
    func invalid() -> Bool {
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
