//
//  NetworkDataFetch.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 24/04/2025.
//

import UIKit
class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init(){
        
    }
    
    func fetchEmail(verificationMails: String, response: @escaping(MailResponseModel?, Error?) -> Void){
        NetworkRequest.shared.requestData(verifiableMail: verificationMails) { result in
            switch result {
            case .success(let data):
                do{
                    let mail = try JSONDecoder().decode(MailResponseModel.self, from: data)
                    response(mail, nil)
                }
                catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil, jsonError)
                }
            case .failure(let error):
                print("Error received rquesting data: \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
