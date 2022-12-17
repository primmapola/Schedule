//
//  AlertCellName.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Oк", style: .default) { [self] (action) in
            let tfAlert = alert.textFields?.first
            guard let text = tfAlert?.text else { return }
            if text == "" || text == " " {
                alertError(title: "Некорректный ввод")
            } else {
                label.text = text
            }
            
            completionHandler(text)
        }
        
        alert.addTextField { (tfAlert: UITextField) in
            tfAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
