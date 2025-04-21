//
//  VerificationButton.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
