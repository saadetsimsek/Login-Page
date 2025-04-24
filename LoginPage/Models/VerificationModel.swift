//
//  VerificationModel.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 22/04/2025.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@icloud.com", "@outlook.com", "@yahoo.com"]
    
    public var nameMail = String()
    
    public var filteredMailArray = [String]()
    
    private func filteringMails(text: String) {
        
        var domainMail = String()
        filteredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else {
            return
        }
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
            
        }
    }
    
    public func getFilteredMails(text: String) {
        filteringMails(text: text)
    }
    
    private func getUsernameFromEmail(text: String){
        guard let atSembolIndex = text.firstIndex(of: "@") else {
            return
        }
        let endIndex = text.index(before: atSembolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        
        nameMail = String(range)
    }
    
    public func getMailName(text: String){
        getUsernameFromEmail(text: text)
    }
}
