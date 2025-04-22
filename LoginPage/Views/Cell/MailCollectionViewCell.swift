//
//  MailCollectionViewCell.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

class MailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MailCollectionViewCell"
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.text = "@gmail.com"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(domainLabel)
    }
    
    private func configure(mailLabelText: String){
        domainLabel.text = mailLabelText
    }
    
    public func cellConfigure(mailLabelText: String) {
        configure(mailLabelText: mailLabelText)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

