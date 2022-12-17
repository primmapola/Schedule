//
//  AlertError.swift
//  Schedule
//
//  Created by Grigory Don on 17.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertError(title: String) {
        
        let alertController = UIAlertController(title: nil, message: "Некорректный ввод", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ок", style: .default)
        
        alertController.addAction(ok)
        
        present(alertController, animated: true)
    }
    
}
