//
//  ExtansionUiViewController.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import UIKit

extension UIViewController {
    func applyGlobalAppearance() {
        self.view.backgroundColor = Constants.Colors.MainColor
        
    }
    
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(ok)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension UIStackView {
    func addArragedSubwies(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
