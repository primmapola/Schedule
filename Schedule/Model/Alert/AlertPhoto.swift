//
//  AlertPhoto.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertPhoto(completion: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            
            let camera = UIImagePickerController.SourceType.camera
            completion(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Галерея", style: .default) { _ in
            
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completion(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "CANCEL", style: .default)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
}
