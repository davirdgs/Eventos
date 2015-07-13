//
//  CredenciamentoViewController.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/7/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class CredenciamentoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var cameraImgView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //emailTextField.delegate = self;
       // nameTextField.delegate = self;
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CameraClicked(sender: AnyObject) {
        // Initialize camera and take a picture

        //if (UIImagePickerController.isSourceTypeAvailable(.Camera)){
                    imagePicker.sourceType = .Camera

        //}
        imagePicker.allowsEditing = true
        imagePicker.cameraCaptureMode = .Photo

        let cameraAvailableFlag = UIImagePickerController.isSourceTypeAvailable(.Camera)
        if (cameraAvailableFlag){
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("presentCamera"), userInfo: nil, repeats: false)
        }
        

    }
    func presentCamera(){
        self.presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        cameraImgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func SendClicked(sender: AnyObject) {
        // insert data to the DB
        let photoImage = cameraImgView.image
        var imageData = UIImagePNGRepresentation(photoImage)
        
        ParticipanteServices.createParticipante("Assistente", name: nameTextField.text, email: emailTextField.text, photo: imageData)
        
        // Display a success alert after registering the participant
        // Create the alert controller
        var alertController = UIAlertController(title: "Staff Manager", message: "Participante cadastrado!", preferredStyle: .Alert)
        
        // Create the action to reset formulary
        var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.cameraImgView.image = UIImage()
            
            NSLog("OK Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    
    // textField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
