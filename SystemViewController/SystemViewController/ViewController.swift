//
//  ViewController.swift
//  SystemViewController
//
//  Created by user2 on 29/01/24.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ShareButtonTapper(_ sender: UIButton) {
        guard let image = ImageView.image else{
            return
        }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController? .sourceView = sender
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func SafariButtonTapper(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func CameraButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
//        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("User selected Camera action")})
        
//        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("User selected Photo Library action")})
        
        alertController.addAction(cancelAction)
//        alertController.addAction(cameraAction)
//        alertController.addAction(photoLibraryAction)
        
        
        alertController.popoverPresentationController? .sourceView = sender
        present(alertController, animated: true, completion: nil)
        
        let imagePicker = UIImagePickerController(); imagePicker.delegate = self
//        let imageAlertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
//        let cancelButtonAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)} )
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photolib = UIAlertAction(title: "Photo Library", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)} )
            alertController.addAction(photolib)
        }

        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImg = info[.originalImage] as? UIImage else{
            return
        }
        dismiss(animated: true, completion: nil)
        ImageView.image = selectedImg
    }
}

