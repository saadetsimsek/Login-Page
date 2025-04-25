//
//  ViewController.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 10/04/2025.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private var verificationModel = VerificationModel()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sea")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailColllectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextField,
                                                                verificationButton,
                                                                collectionView],
                                        axis: .vertical,
                                        spacing: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        
    }

    private func setupViews(){
        
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self,
                                     action: #selector(verificationButtonDidTap),
                                     for: .touchUpInside)
    }
    
    @objc private func verificationButtonDidTap(){
        print("Button tapped")
        
        guard let mail = mailTextField.text else { return }
        
        NetworkDataFetch.shared.fetchEmail(verificationMails: mail) { result, error in
            if error == nil {
                guard let result = result else { return }
                if result.success {
                    guard let didYouMeanError = result.did_you_mean else {
                        Alert.showResultAlert(vc: self, message: "Mail status \(result.result) \n \(result.reasonDescription)")
                        return
                    }
                    Alert.showErrorAlert(vc: self,
                                         message: "Did you mean \(didYouMeanError)") { [weak self] in
                        guard let self = self else { return }
                        self.mailTextField.text = didYouMeanError
                    }
                    //print("change mail")
                }
                else{
                    guard let errorDescription = error?.localizedDescription else { return }
                    Alert.showResultAlert(vc: self, message: errorDescription)
                }
            }
        }
    }
    
    private func setDelegates(){
        collectionView.selectedMailProtocol = self
        mailTextField.textFieldDelegate = self
    }
    
    //MARK: - Constraints
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            verificationButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }

}

//MARK: - Verification Protocol
// select suggest to list example gmaşl.com, yahoo, yandex
extension VerificationViewController: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        mailTextField.text = mailFullName
        statusLabel.isValid = mailFullName.isvalid()
        verificationButton.isValid = mailFullName.isvalid()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
       // print(mailFullName)
    }
    
    
}

//MARK: - Textfield Protocol

extension VerificationViewController: ActionsMailTextFieldProtocol {
    func typingText(text: String) {
        statusLabel.isValid = text.isvalid()
        verificationButton.isValid = text.isvalid()
        verificationModel.getFilteredMails(text: text)
        collectionView.update(with: verificationModel)
    }
    
    func cleanOutTextfield() {
        statusLabel.setDefaultSettings()
        verificationButton.setDefaultSettings()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
    }
    
    
}
