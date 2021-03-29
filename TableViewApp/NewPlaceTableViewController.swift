//
//  NewPlaceTableViewController.swift
//  TableViewApp
//
//  Created by Юлия on 3/25/21.
//  Copyright © 2021 Nikita. All rights reserved.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    var newPlace: Place?
    var imageIsChanged = false
    @IBOutlet var saveButtom: UIBarButtonItem!
    @IBOutlet var imagePlace: UIImageView!
    @IBOutlet var namePlace: UITextField!
    @IBOutlet var locationPlace: UITextField!
    @IBOutlet var typePlace: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        saveButtom.isEnabled = false
        namePlace.addTarget(nil, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoicon = #imageLiteral(resourceName: "photo")
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
               self.chooseImagePicker(source: .camera)
                
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
               self.chooseImagePicker(source: .photoLibrary)
                
            }
            photo.setValue(photoicon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            
            present(actionSheet,animated: true)
            
        } else {
            view.endEditing(true)
        }
        
    }

    
    func saveNewPlace() {
        
        var image : UIImage?
        if imageIsChanged {
            image = imagePlace.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        newPlace = Place(name: namePlace.text!,
                         location: locationPlace.text,
                         type: typePlace.text,
                         image: image,
                         restaurantName: nil)
    }
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


extension NewPlaceTableViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


    @objc private func textFieldChanged () {
        if namePlace.text?.isEmpty == false {
            saveButtom.isEnabled = true
        } else {
            saveButtom.isEnabled = false
        }
 
    
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
        imagePlace.image = info[.editedImage] as? UIImage
        imagePlace.clipsToBounds = true
        imageIsChanged = true
        imagePlace.contentMode = .scaleAspectFill
        
        dismiss(animated: true)
        
    
        
    }
}
