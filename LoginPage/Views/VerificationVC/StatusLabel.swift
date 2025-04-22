//
//  StatusLabel.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSettings()
            }
            else{
                setNotValidSetting()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        text = "Check your email"
        textColor = .black
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true //  metni sığmıyorsa otomatik olarak yazı boyutunu küçültmesini sağlar
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSetting(){
        text = "Mail is not valid. Example: name@domain.com"
        textColor = .red
    }
    
    private func setValidSettings(){
        text = "Mail is valid"
        textColor = .green
    }
    
    public func setDefaultSettings(){
        configure()
    }
}
