//
//  NetworkRequest.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 24/04/2025.
//

import UIKit

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    let apiKey = "live_14537fc6eedf1d0af41099a889172194a2d6319dcb47c3d8e39a8052dbd6f0be"

    
    private init() { }
    
    func requestData(verifiableMail: String, completion: @escaping(Result<Data, Error>) -> Void) {
        let url = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        
        guard let urlRequest = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
    
}
