//
//  NewPlaceTableViewController.swift
//  TableViewApp
//
//  Created by Юлия on 3/25/21.
//  Copyright © 2021 Nikita. All rights reserved.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {

    @IBOutlet var imageOfPlace: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
               self.chooseImagePicker(source: .camera)
                
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
               self.chooseImagePicker(source: .photoLibrary)
                
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            
            present(actionSheet,animated: true)
            
        } else {
            view.endEditing(true)
        }
        
    }

 
}


extension NewPlaceTableViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}



extension NewPlaceTableViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func chooseImagePicker (source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
             imagePicker.sourceType = source
            present(imagePicker,animated: true)
        
    }
}

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.clipsToBounds = true
        imageOfPlace.contentMode = .scaleAspectFill
        
        dismiss(animated: true)
        
    
        
    }
}
