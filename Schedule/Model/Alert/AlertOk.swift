//
//  AlertOk.swift
//  Schedule
//
//  Created by Grigory Don on 17.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String) {
        
        let alertController = UIAlertController(title: nil, message: "Сохранено", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(ok)
        
        present(alertController, animated: true)
    }
    
}
