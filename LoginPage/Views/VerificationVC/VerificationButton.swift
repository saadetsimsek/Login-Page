//
//  VerificationButton.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSettings()
            }
            else {
                setNotValidSettings()
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
        backgroundColor = .white
        setTitle("Verification Button", for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Book", size: 17)
        isEnabled = false // tıklanabilir olup oladığı kontrolü
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setValidSettings(){
        isEnabled = true
        alpha = 0.5
    }
    
    private func setNotValidSettings(){
        isEnabled = false
        alpha = 0.5
    }
    
    public func setDefaultSettings(){
        configure()
    }
    
}
