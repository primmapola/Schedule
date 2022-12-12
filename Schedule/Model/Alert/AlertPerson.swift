//
//  AlertPerson.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertPerson(label: UILabel, completion: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let friend = UIAlertAction(title: "Друг", style: .default) { _ in
            label.text = "Друг"
            let typeContact = "Друг"
            completion(typeContact)
        }
        
        let teacher = UIAlertAction(title: "Учитель", style: .default) { _ in
            label.text = "Учитель"
            let typeContact = "Учитель"
            completion(typeContact)
        }
        
        let cancel = UIAlertAction(title: "CANCEL", style: .default)
        
        alertController.addAction(friend)
        alertController.addAction(teacher)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
}
