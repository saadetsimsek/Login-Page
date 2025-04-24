//
//  Alert.swift
//  LoginPage
//
//  Created by Saadet Şimşek on 24/04/2025.
//

import Foundation
import UIKit

struct Alert {
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String){
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true)
        }
    }
    
    static func showResultAlert(vc: UIViewController, message: String){
        showSimpleAlert(vc: vc, title: "Result", message: message)
    }
    
    static func showErrorAlert(vc: UIViewController, message: String, completion: @escaping ()-> Void){
        showSimpleAlert(vc: vc, title: "Error", message: message)
    }
}
