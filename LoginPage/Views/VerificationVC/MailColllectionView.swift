//
//  MailColllectionView.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 21/04/2025.
//

import Foundation
import UIKit

protocol SelectProposedMailProtocol: AnyObject {
    func selectProposedMail(indexPath: IndexPath)
}

class MailColllectionView: UICollectionView {
    
    weak var selectedMailProtocol: SelectProposedMailProtocol?
    
    private var verificationModel = VerificationModel()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(MailCollectionViewCell.self, forCellWithReuseIdentifier: MailCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        
        delegate = self
        dataSource = self
    }
    
    public func update(with model: VerificationModel) {
        self.verificationModel = model
        reloadData()
    }
}

//MARK: -CollectionView Delegate
extension MailColllectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  verificationModel.filteredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MailCollectionViewCell.identifier, for: indexPath) as? MailCollectionViewCell else {
            return UICollectionViewCell()
        }
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMailProtocol?.selectProposedMail(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5,
               height: 40)
    }
}
