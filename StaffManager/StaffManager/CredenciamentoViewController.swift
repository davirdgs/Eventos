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
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailTextField.delegate = self;
        nameTextField.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CameraClicked(sender: AnyObject) {
        // Initialize camera and take a picture
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        cameraImgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    @IBAction func SendClicked(sender: AnyObject) {
        // insert data to the DB
        
        
    }
    
    
    // textField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
