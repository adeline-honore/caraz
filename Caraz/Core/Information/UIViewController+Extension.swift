//
//  UIViewController+Extension.swift
//  Caraz
//
//  Created by HONORE Adeline on 27/03/2023.
//

import UIKit

extension UIViewController {
    private func displayAlert(title: String? = nil, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    func informationMessage(element: InfoType) {
        displayAlert(message: element.message)
    }
}
