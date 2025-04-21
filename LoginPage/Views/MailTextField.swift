//
//  MailTextField.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

class MailTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 15,
                                        height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail"
        font = UIFont(name: "AppleSDGothicNeo-Medium", size: 20)
        tintColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
    }
}
